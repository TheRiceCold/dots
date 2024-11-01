# TODO: Find a better ad-blocker
pkgs: [
  (pkgs.writeText "youtube-adb.user.js" /*js*/ ''
    function skipAds() {
      const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button-modern')
      if (btn) btn.click()
      const ad = [...document.querySelectorAll('.ad-showing')][0]
      if (ad) document.querySelector('video').currentTime = 9999999999
    }

    document.addEventListener('load', skipAds, true)
  '')
]
