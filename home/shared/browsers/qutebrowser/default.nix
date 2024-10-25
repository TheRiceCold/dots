{ pkgs, ... }: {
  programs.qutebrowser = {
    enable = true;
    settings = import ./settings.nix;
    # keyMappings = { };
    searchEngines = {
      DEFAULT = "https://google.com/search?q={}";
			ytm = "https://www.music.youtube.com/search?q={}";
      yt = "https://www.youtube.com/results?search_query={}";
      repo = "https://www.github.com/search?g={}&type=repositories";
			ig = "https://www.instagram.com/{}";
			tt = "https://www.tiktok.com/@{}";
			r = "https://reddit.com/r/{}";
    };
    greasemonkey = [
      (pkgs.writeText "skip-youtube-ads.js" /*js*/''
				function skipAds() {
					const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button-modern')
					if (btn) btn.click()
					const ad = [...document.querySelectorAll('.ad-showing')][0]
					if (ad) document.querySelector('video').currentTime = 9999999999
				}

				document.addEventListener('load', skipAds, true)
			'')
    ];
  };
}
