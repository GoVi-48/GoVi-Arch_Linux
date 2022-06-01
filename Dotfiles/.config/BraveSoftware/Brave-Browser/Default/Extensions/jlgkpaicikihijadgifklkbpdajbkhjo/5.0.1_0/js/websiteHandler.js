const RequestDetailActionMap = {
  'Screen 1': 'onboarding_screen_1',
  'Screen 2': 'onboarding_screen_2',
  'Screen 3':'onboarding_screen_3',
  'Screen 4':'onboarding_screen_4',
  'Screen 5':'finish_onboarding_button_click',
  'Screen 6': 'onboarding_final_screen'
  };
  
chrome.runtime.onMessage.addListener(request => {
  let event = new CustomEvent(request);
  document.dispatchEvent(event);
});

document.addEventListener('getExtensionVersion', () => {
  let event = new CustomEvent('responseGetExtensionVersion', {
    detail: {
      version: chrome.runtime.getManifest().version,
    },
  });
  document.dispatchEvent(event);
});

document.addEventListener('gaEventToExtension', request => {
  if(RequestDetailActionMap[request.detail.action])
  chrome.runtime.sendMessage({
      type: "gaEvent",
      gaCategory: "onboarding_screen",
      gaAction: RequestDetailActionMap[request.detail.action],
      gaLabel:RequestDetailActionMap[request.detail.action]
  });
});

document.addEventListener('playLaterOnboarding', request => {
  chrome.runtime.sendMessage({ type: 'showOnboardingLater' });
});
