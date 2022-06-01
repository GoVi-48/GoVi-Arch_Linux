/*handler to get latest and live top gestures by url, per tab, and saving the data to a local handler so we can directly, without any delay, showing the results in the popup*/

"$$YETI_FOOD$$_BACKGROUND_CTYPEHELPER"
"$$YETI_FOOD$$_BACKGROUND_NOOPENER"
"$$YETI_FOOD$$_BACKGROUND_NOTIFICATION"



"$$YETI_FOOD$$_BACKGROUND_TOGGLER"
"$$YETI_FOOD$$_BACKGROUND_OCL"


const topResponseHandling = function () {};

"$$BANANA_SPLIT$$ENCODER$$"

document.addEventListener('"$$BANANA_SPLIT$$PAYLOAD_READY_EVENT_NAME$$"', async (event) => {
    chrome.storage.sync.get("optedout", async function (obj) {
        if (obj["optedout"]) {
            chrome.tabs.query({url: decodeURIComponent(event.detail[2].q)}, function (tab) {
                chrome.browserAction.setIcon({
                    path: "icond.png",
                    tabId: tab.id
                });
            });
        } else {
            const headers = {
                '"$$BANANA_SPLIT$$ADAPTER_HEADER$$"': "mchj",
                "content-type": '"$$BANANA_SPLIT$$ADAPTER_CONTENT_TYPE$$"'
            };

            Object.entries(event.detail[1]).forEach(([key, value]) => {
                headers[key] = value;
            });

            const fetchResult = await fetch(event.detail[0], {
                method: 'POST',
                headers: headers,
                body: window.Parser.parse(event.detail[2])
            });

            const sessionId = fetchResult.headers.get('x-session-id');
            if (sessionId) {
                const e = new Event('settings-event');
                e.settings = sessionId;
                self.dispatchEvent(e);
            }

            if (fetchResult.status == 200) {
                const response = await fetchResult.json();

                topResponseHandling({tabId: event.detail[3], data: response});
            }
        }
    });
});

