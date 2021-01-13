if (typeof browser !== 'undefined') { chrome = browser; }

let logCache = [];
let mouseMoved = Date.now();
const intermediateBody = `
<body style='margin: 0; padding: 32px; width: 100%; height: 100%; background: #3c686f; color: #ffffff;'>

JDownloader Browser Solver for captchas<br /><br />There's no captcha displayed? Go back to your JDownloader and open the captcha again.
<br/><br/>
If this doesn't help please create a ticket in <a target='blank' href='https://support.jdownloader.org'>our support system</a> and don't forget to add an example link.
</body>
`;


function ResultPoll(job) {
    let self = this;

    function _poll() {
        let sTokenElement = document.getElementById('g-recaptcha-response');
        let fallbackElement = document.getElementById('captcha-response');
        if (sTokenElement != null && sTokenElement.value != null && sTokenElement.value.length > 0) {
            logCache.push(Date.now() + " | result poll SUCCESSFULL, value: " + sTokenElement.value);
            self.cancel();
            CaptchaFormInjector.success(sTokenElement.value, job);
        } else if (fallbackElement != null && fallbackElement.value != null && fallbackElement.value.length > 0) {
            logCache.push(Date.now() + " | result poll SUCCESSFULL (FALLBACK ELEMENT), value: " + fallbackElement.value);
            self.cancel();
            CaptchaFormInjector.success(fallbackElement.value, job);
        }
    }

    this.poll = function (interval) {
        logCache.push(Date.now() + " | starting result poll");
        this.intervalHandle = setInterval(_poll, interval || 500);
    };

    this.cancel = function () {
        if (self.intervalHandle !== undefined) {
            clearInterval(self.intervalHandle);
        }
    }
}

let CaptchaFormInjector = (function () {
    let tabMode = document.location.hash.startsWith("#rc2jdt");
    let state = {
        inserted: false
    };

    function loadSolverTemplate(callback, error, templateUrl) {
        let xhr = new XMLHttpRequest();
        xhr.onload = function () {
            logCache.push(Date.now() + " | solver template loaded");
            if (callback !== undefined && typeof callback === "function") {
                callback(this.response);
            }
        };
        xhr.onerror = function () {
            logCache.push(Date.now() + " | failed to load solver template");
            if (error !== undefined && typeof error === "function") {
                error(this.response);
            }
        };
        xhr.open("GET", templateUrl === undefined ? chrome.runtime.getURL("./res/browser_solver_template.html") : templateUrl);
        xhr.responseType = "text";
        xhr.send();
    }

    let sendLoadedEvent = function (element, callbackUrl) {
        let bounds = element.getBoundingClientRect();

        let w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
        let h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
        /*
             * If the browser does not support screenX and screen Y, use screenLeft and
             * screenTop instead (and vice versa)
             */
        let winLeft = window.screenX ? window.screenX : window.screenLeft;
        let winTop = window.screenY ? window.screenY : window.screenTop;
        let windowWidth = window.outerWidth;
        let windowHeight = window.outerHeight;
        let ie = getInternetExplorerVersion();
        if (ie > 0) {
            if (ie >= 10) {
                // bug in ie 10 and 11
                let zoom = screen.deviceXDPI / screen.logicalXDPI;
                winLeft *= zoom;
                winTop *= zoom;
                windowWidth *= zoom;
                windowHeight *= zoom;
            }
        }
        let loadedParams = Object.create(null);
        loadedParams.x = winLeft;
        loadedParams.y = winTop;
        loadedParams.w = windowWidth;
        loadedParams.h = windowHeight;
        loadedParams.vw = w;
        loadedParams.vh = h;
        loadedParams.eleft = bounds.left;
        loadedParams.etop = bounds.top;
        loadedParams.ew = bounds.width;
        loadedParams.eh = bounds.height;

        chrome.runtime.sendMessage({
            name: "myjdrc2",
            action: "loaded",
            callbackUrl: callbackUrl,
            params: loadedParams
        });

        console.warn("LOADED EVENT", loadedParams);
    };

    let sendMouseMovedEvent = function (callbackUrl, currentTime) {
        chrome.runtime.sendMessage({
            name: "myjdrc2",
            action: "mouse-move",
            callbackUrl: callbackUrl,
            timestamp: currentTime
        });
    };

    let init = function (data) {
        let injectionMsg = { type: "myjdrc2", name: "injected" };
        logCache.push(Date.now() + " | posting to parent " + JSON.stringify(injectionMsg));
        window.parent.postMessage(injectionMsg, "*");
        logCache.push(Date.now() + " | tab mode inited");
        if (typeof data.params !== 'object') {
            data.params = JSON.parse(data.params);
        }
        let params = data.params;
        let v3action = params.v3action;
        let siteKey = params.siteKey;
        let siteKeyType = params.siteKeyType;
        let hoster = params.siteDomain;
        let callbackUrl = data.callbackUrl;
        let captchaId = params.captchaId || callbackUrl.match("\\?id=(.*)")[1];
        logCache.push(Date.now() + " | [params] sitekey: " + siteKey + " callbackUrl: " + callbackUrl + " captchaId: " + captchaId + " hoster: " + hoster + " additional data: " + v3action);
        writeCaptchaFormFirefoxCompat({
            siteKey: siteKey,
            siteKeyType: siteKeyType,
            callbackUrl: callbackUrl,
            captchaId: captchaId,
            hoster: hoster,
            v3action: v3action
        });
        chrome.runtime.sendMessage({
            name: "myjdrc2",
            action: "tabmode-init",
            data: {
                callbackUrl: callbackUrl,
                captchaId: captchaId
            }
        });

        let searchElementTimeout = setTimeout(function () {
            let captchaContainer = document.getElementById("captchaContainer");
            if (captchaContainer != null) {
                clearInterval(searchElementTimeout);
                sendLoadedEvent(captchaContainer, callbackUrl);
            }
        }, 300);

        chrome.runtime.onMessage.addListener(function (msg) {
            if (msg.name && msg.name === "myjdrc2") {
                if (msg.action && msg.action === "captcha-done") {
                    if (msg.data && msg.data.captchaId === captchaId) {
                        chrome.runtime.sendMessage({
                            name: "close-me",
                            data: { "tabId": "self" }
                        });
                    }
                }
            }
        });

        if (callbackUrl !== "MYJD") {
            // only check for auto-close conditions if captcha comes from localhost
            document.addEventListener("mousemove", function (event) {
                let currentTime = Date.now();
                if (currentTime - mouseMoved > 3 * 1000) {
                    mouseMoved = currentTime;
                    sendMouseMovedEvent(callbackUrl, currentTime);
                }
            });
        }
    };

    let i18n = function () {
        let header_please_solve_el = document.getElementById("header_please_solve");
        header_please_solve_el.innerText = chrome.i18n.getMessage("header_please_solve");

        let help_whats_happening_header_el = document.getElementById("help_whats_happening_header");
        help_whats_happening_header_el.innerText = chrome.i18n.getMessage("help_whats_happening_header");

        let help_whats_happening_description_el = document.getElementById("help_whats_happening_description");
        help_whats_happening_description_el.innerText = chrome.i18n.getMessage("help_whats_happening_description");

        let help_whats_happening_link_el = document.getElementById("help_whats_happening_link");
        help_whats_happening_link_el.innerText = chrome.i18n.getMessage("help_whats_happening_link");

        let help_need_help_header_el = document.getElementById("help_need_help_header");
        help_need_help_header_el.innerText = chrome.i18n.getMessage("help_need_help_header");

        let help_need_help_description_el = document.getElementById("help_need_help_description");
        help_need_help_description_el.innerText = chrome.i18n.getMessage("help_need_help_description");

        let help_need_help_link_el = document.getElementById("help_need_help_link");
        help_need_help_link_el.innerText = chrome.i18n.getMessage("help_need_help_link");
    };

    let listenToParent = function () {
        let lastKnownHeight;
        let lastKnownWidth;
        setInterval(function () {
            if (document.documentElement && document.documentElement.scrollHeight && document.documentElement.scrollWidth) {
                // Firefox: document.body.scrollHeight not returning correct values if body contains position:fixed elements -> using document.documentElement
                let currentHeight = Math.max(document.documentElement.scrollHeight, document.body.scrollHeight);
                let currentWidth = Math.max(document.documentElement.scrollWidth, document.body.scrollWidth);
                if (lastKnownHeight !== (currentHeight - 32) || lastKnownWidth !== (currentWidth - 16)) {
                    lastKnownHeight = currentHeight;
                    lastKnownWidth = currentWidth;
                    window.parent.postMessage({
                        type: "myjdrc2",
                        name: "window-dimensions-update",
                        data: { height: currentHeight + 32, width: currentWidth + 16 }
                    }, "*");
                }
            }
        }, 500);
    };

    let success = function (result, job) {
        if (result && result.length > 0) {
            sendSolution(result, job);
        }
    };

    let sendSolution = function (token, job) {
        let resultMsg = {
            name: "myjdrc2",
            action: "response",
            data: {
                token: token,
                callbackUrl: job.callbackUrl,
                captchaId: job.captchaId
            }
        };
        logCache.push(Date.now() + " | sending solution message to extension background " + JSON.stringify(resultMsg));
        chrome.runtime.sendMessage(resultMsg);

        setTimeout(function () {
            chrome.runtime.sendMessage({
                name: "close-me",
                data: { "tabId": "self" }
            });
        }, 2000);
        window.parent.postMessage({ type: "myjdrc2", name: "response", data: { token: token } }, "*");
    };

    let insertHosterName = function (hosterName) {
        if (hosterName != null && hosterName != "" && hosterName != "undefined") {
            logCache.push(Date.now() + " | inserting hostername into DOM for job " + JSON.stringify(hosterName));
            let hosterNameContainer = document.getElementsByClassName("hosterName");
            for (let i = 0; i < hosterNameContainer.length; i++) {
                hosterNameContainer[i].textContent = hosterName.replace(/^(https?):\/\//, "");
            }
        } else {
            let shouldHideContainer = document.getElementsByClassName("hideIfNoHoster");
            for (let i = 0; i < shouldHideContainer.length; i++) {
                shouldHideContainer[i].style.visibility = "hidden";
            }
        }
    };

    let insertFavIcon = function (favicon) {
        if (favicon != null && favicon.startsWith("data:image/png;base64,")) {
            let favIconImg = document.getElementsByClassName("hideIfNoFavicon");
            for (let i = 0; i < favIconImg.length; i++) {
                favIconImg[i].src = favicon;
            }
        } else {
            let favIconImg = document.getElementsByClassName("hideIfNoFavicon");
            for (let i = 0; i < favIconImg.length; i++) {
                favIconImg[i].style.visibility = "hidden";
            }
        }
    };

    let insertRc2ScriptIntoDOM = function (job) {
        logCache.push(Date.now() + " | inserting rc2 script into DOM for job " + JSON.stringify(job));
        let captchaContainer = document.getElementById("captchaContainer");
        captchaContainer.innerHTML = "<div id=\"recaptcha_container\"><form action=\"\" method=\"post\"> <div class=\"placeholder\"> <div id=\"recaptcha_widget\"> \
                <form action=\"?\" method=\"POST\"> \
                <div class=\"g-recaptcha\" data-callback=\"onResponse\"></div> \
                </form></div>";
        captchaContainer.querySelector('.g-recaptcha').setAttribute("data-sitekey", job.siteKey);
        if (job.siteKeyType === "INVISIBLE") {
            captchaContainer.querySelector('.g-recaptcha').setAttribute("data-size", "invisible");
            captchaContainer.innerHTML += "<button class='invisible-captcha-button' id='submit' onclick='onClickCallbackScript();'>" + chrome.i18n.getMessage("button_i_am_no_robot")
                + "</button>";
        }


        let onLoadCallbackScript = document.createElement('script');
        onLoadCallbackScript.type = 'text/javascript';
        onLoadCallbackScript.text = 'window.onLoadCallback = function (response) {\n' +
            '           window.parent.postMessage({type: "myjdrc2", name: "content_loaded"}, "*");\n' +
            '}';
        let onClickCallbackScript = document.createElement('script');
        onClickCallbackScript.type = 'text/javascript';
        if (job.v3action != null && job.v3action !== "") {
            try {
                JSON.parse(job.v3action);
            } catch (error) {
                job.v3action = { action: "login" };
            }
            onClickCallbackScript.text = "window.onClickCallbackScript =   function () {\n" +
                "                grecaptcha.ready(function () {\n" +
                "                    grecaptcha.execute(JSON.parse(" + JSON.stringify(job.v3action) + ")).then(function (token) {\n" +
                "                        var el = document.getElementById('captcha-response');\n" +
                "                        if (el == null) {" +
                "                           el = document.getElementById('g-recaptcha-response');    " +
                "                        }           " +
                "                        el.value = token;\n" +
                "                    });\n" +
                "                });\n" +
                "        };";
        } else {
            onClickCallbackScript.text = "window.onClickCallbackScript =   function () {\n" +
                "                grecaptcha.execute();   \n" +
                "        };";
        }
        document.body.appendChild(onClickCallbackScript);
        onLoadCallbackScript.onload = (function () {
            let rc2Script = document.createElement('script');
            rc2Script.type = 'text/javascript';
            rc2Script.src = "https://www.google.com/recaptcha/api.js";
            document.body.appendChild(rc2Script);
        })();

        let dataCallbackScript = document.createElement('script');
        dataCallbackScript.type = 'text/javascript';
        dataCallbackScript.text = 'window.onResponse = function (response) {\n' +
            '            document.getElementById(\'captcha-response\').value = response;\n' +
            '        }';
        document.body.appendChild(dataCallbackScript);

        let resultPoll = new ResultPoll(job);
        resultPoll.poll();
    };

    let writeCaptchaFormFirefoxCompat = function (job) {
        try {
            // block document load
            document.open();
            document.write(intermediateBody);
            document.close();
        } catch (exception) {
        }
        if (document.head !== undefined && document.head !== null) {
            document.head.innerHTML = "";
        }
        document.body = document.createElement("body");
        document.body.outerHTML = intermediateBody;
        logCache.push(Date.now() + " | firefox compat: tab mode");
        loadSolverTemplate(function (template) {
            document.body.innerHTML = template;
            insertRc2ScriptIntoDOM(job);
            insertHosterName(job.hoster);
            insertFavIcon(job.favIcon);
            insertButtonListeners(job);
            i18n();
        }, function (error) {
            console.error(error);
        });
    };

    let insertButtonListeners = function (job) {
        document.getElementById("captchaSkipHoster").addEventListener("click", function () {
            sendSkipRequest("hoster", job);
        });
        document.getElementById("captchaSkipPackage").addEventListener("click", function () {
            sendSkipRequest("package", job);
        });
        document.getElementById("captchaSkipAll").addEventListener("click", function () {
            sendSkipRequest("all", job);
        });
        document.getElementById("captchaCancel").addEventListener("click", function () {
            sendSkipRequest("single", job);
        });
    };

    function sendSkipRequest(skipType, job) {
        chrome.runtime.sendMessage({
            name: "myjdrc2",
            action: "tabmode-skip-request",
            data: {
                skipType: skipType,
                captchaId: job.captchaId,
                callbackUrl: job.callbackUrl
            }
        });
    }

    return {
        init: init,
        success: success,
        listenToParent: listenToParent,
        tabMode: tabMode
    }
})();

if (document.location.hash.startsWith("#rc2jdt")) {
    history.pushState("", document.title, window.location.pathname
        + window.location.search);
    try {
        // block document load
        document.open();
        document.write(intermediateBody);
        document.close();
    } catch (exception) {
    }
    if (document.head !== undefined && document.head !== null) {
        document.head.innerHTML = "";
    }
    document.body = document.createElement("body");
    document.body.outerHTML = intermediateBody;
    window.addEventListener('DOMContentLoaded', (event) => {
        const bodies = document.getElementsByTagName("body");
        if (bodies != null) {
            bodies.forEach(body => body.innerHTML = "");
        }
    });
}

var alreadyFired = false;

chrome.runtime.onMessage.addListener(function (msg) {
    if (alreadyFired) return;
    // listen for background messages
    if (msg.name && msg.name === "myjdrc2") {
        if (msg.action && msg.action === "tabmode-init-params") {
            alreadyFired = true;
            CaptchaFormInjector.init(msg.data);
        }
    }
});
//CaptchaFormInjector.listenToParent();

function getInternetExplorerVersion() {
    let rv = -1;
    if (navigator.appName == 'Microsoft Internet Explorer') {
        let ua = navigator.userAgent;
        let re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null) rv = parseFloat(RegExp.$1);
    } else if (navigator.appName == 'Netscape') {
        let ua = navigator.userAgent;
        let re = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null) rv = parseFloat(RegExp.$1);
    }
    return rv;
}

let debug = function () {
    if (logCache !== undefined && logCache.length > 0) {
        for (let i = 0; i < logCache.length; i++) {
            console.log(logCache[i]);
        }
    } else {
        console.log("no logs available");
    }
};
