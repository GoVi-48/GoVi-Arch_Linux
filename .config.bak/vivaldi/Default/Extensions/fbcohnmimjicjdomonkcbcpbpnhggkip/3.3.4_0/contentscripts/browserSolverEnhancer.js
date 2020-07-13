if (typeof browser !== 'undefined') { chrome = browser; }

let BrowserSolverEnhancer = function () {
    let IFRAME_VISIBLE_STYLE = "display:block;border:none; width: 100%;height: 600px;";
    let IFRAME_INVISIBLE_STYLE = "display:none;border:none; width: 100%;height: 600px;";

    let Elements = Object.create(null);

    let captchaParams = {
        siteKey: document.getElementsByName("sitekey") !== undefined ? document.getElementsByName("sitekey")[0].content : undefined,
        siteKeyType: document.getElementsByName("sitekeyType") !== undefined ? document.getElementsByName("sitekeyType")[0].content : undefined,
        siteDomain: document.getElementsByName("siteDomain") !== undefined ? document.getElementsByName("siteDomain")[0].content : undefined,
        siteUrl: document.getElementsByName("siteUrl") !== undefined ? document.getElementsByName("siteUrl")[0].content : undefined,
        v3action: (function () {
            let element = document.getElementsByName("v3action");
            if (element != null && element[0] != null) {
                return decodeURIComponent(element[0].content).replace(/\+/g, ' ')
            }
            return undefined;
        })(),
        isValid: function () {
            return this.siteKey !== undefined && this.siteKey.length > 0 && this.siteDomain !== undefined && this.siteDomain.length > 0;
        },
        getSanitizedContextUrl: function () {
            if (this.siteDomain.indexOf("http://") === -1 && this.siteDomain.indexOf("https://") === -1) {
                return "http://" + this.siteDomain;
            }
            return this.siteDomain;
        },
        getSanitizedSiteUrl: function () {
            if (this.siteUrl.indexOf("http://") === -1 && this.siteUrl.indexOf("https://") === -1) {
                return "http://" + this.siteUrl;
            }
            return this.siteUrl;
        },
        getFinalUrl: function () {
            if (this.siteUrl != null && this.siteUrl !== "") {
                return this.getSanitizedSiteUrl();
            } else {
                return this.getSanitizedContextUrl();
            }
        }
    };

    let hideExtensionInfoContainers = function () {
        let noExtensionElements = document.getElementsByClassName("no_extension");
        if (noExtensionElements.length && noExtensionElements.length !== 0) {
            for (let i = 0; i < noExtensionElements.length; i++) {
                noExtensionElements[i].setAttribute("style", "display:none");
            }
        }
    };

    let isBoundToDomain = function () {
        return document.getElementsByName("boundToDomain") !== undefined && document.getElementsByName("boundToDomain").length > 0 && document.getElementsByName("boundToDomain")[0].content === "true";
    };

    let isFrameOptionsSameOrigin = function () {
        return document.getElementsByName("sameOrigin") !== undefined && document.getElementsByName("sameOrigin").length > 0 && document.getElementsByName("sameOrigin")[0].content === "true";
    };

    let injectCaptchaIntoFrame = function () {
        Elements.wrapper = document.getElementsByClassName("wrap")[1];
        Elements.wrapper.appendChild(Elements.loadingElement);

        let rc2Parameter = {
            "siteKey": "" + captchaParams.siteKey,
            "siteKeyType": "" + captchaParams.siteKeyType,
            "contextUrl": "" + captchaParams.getSanitizedContextUrl(),
            "siteUrl": "" + captchaParams.getSanitizedSiteUrl(),
            "v3action": "" + captchaParams.v3action,
            "favIcon": "" + captchaParams.favIcon
        };

        Elements.iframe = document.createElement("iframe");
        Elements.iframe.setAttribute("sandbox", "allow-scripts allow-same-origin allow-forms");
        Elements.iframe.src = captchaParams.getFinalUrl() + "#rc2jd";
        Elements.iframe.setAttribute("style", IFRAME_INVISIBLE_STYLE);
        Elements.iframe.onload = function () {
            let payload = Object.create(null);
            payload.job = rc2Parameter;
            payload.type = "rc2_payload";
            Elements.iframe.contentWindow.postMessage(payload, "*");
        };
        Elements.wrapper.appendChild(Elements.iframe);
    };

    let injectCaptchaIntoTab = function () {
        captchaParams.sanitizedContextUrl = captchaParams.getSanitizedContextUrl();
        captchaParams.siteUrl = captchaParams.getSanitizedSiteUrl();
        captchaParams.finalUrl = captchaParams.getFinalUrl();
        chrome.runtime.sendMessage(chrome.runtime.id, {
            name: "myjdrc2",
            action: "init-tab-mode",
            data: {
                params: JSON.stringify(captchaParams),
                callbackUrl: window.location.href
            }
        });
    };

    let init = function () {
        Elements.loadingElement = document.createElement("div");
        Elements.loadingElement.setAttribute("style", "font-weight: bold; margin-top: 20px;margin-bottom: 8px;margin-left: 8px;")
        Elements.loadingElement.textContent = "Please wait...";

        if (!captchaParams.isValid()) {
            Elements.loadingElement.setAttribute("style", "color:red;font-weight: bold; margin-top: 20px;margin-bottom: 8px;margin-left: 8px;");
            Elements.loadingElement.textContent = "Can not load captcha. This is a bug, please contact us!";
        }

        if (isFrameOptionsSameOrigin()) {
            injectCaptchaIntoTab();
        } else {
            listenToFrame();
            injectCaptchaIntoFrame();
        }
    };

    let listenToFrame = function () {
        window.addEventListener("message", function (event) {
            let eventData = event.data;
            if (eventData && eventData.type === 'myjdrc2') {
                if (eventData.name === 'response') {
                    sendSolution(eventData.data.token);
                } else if (eventData.name === 'injected') {
                    // nothing to do
                } else if (eventData.name === 'content_loaded') {
                    Elements.loadingElement.textContent = "Please solve this captcha";
                    if (Elements.iframe) {
                        Elements.iframe.setAttribute("style", IFRAME_VISIBLE_STYLE);
                    }
                } else if (eventData.name === 'window-height-update') {
                    if (data.height !== undefined) {
                        Elements.iframe.setAttribute("height", "" + data.height + "px");
                    }
                }
            }
        }, false);
    };

    return {
        init: init,
        isBoundToDomain: isBoundToDomain,
        isFrameOptionsSameOrigin: isFrameOptionsSameOrigin,
        hideExtensionInfoContainers: hideExtensionInfoContainers
    }
};

window.alert = function () {
};

document.body.innerHTML = "<body style='width: 100%'><div style='margin: auto; font-size: 1.5em; width: 50%; padding: 32px;text-align:center; color: #fefefe'>Loading Browser Solver</div></body>";
let enhancer = new BrowserSolverEnhancer();
enhancer.hideExtensionInfoContainers();

if (enhancer.isBoundToDomain() || enhancer.isFrameOptionsSameOrigin()) {
    enhancer.init();
}

function sendSolution(token) {
    chrome.runtime.sendMessage(chrome.runtime.id, {
        name: "myjdrc2",
        action: "response",
        data: {
            token: token,
            callbackUrl: window.location.href
        }
    });
}
