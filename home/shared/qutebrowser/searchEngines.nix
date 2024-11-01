let
  gh = type: "https://www.github.com/search?g={}&type=${type}";
in {
  DEFAULT = "https://google.com/search?q={}";
  r = "https://reddit.com/r/{}";
  ig = "https://instagram.com/{}";

  ytm = "https://music.youtube.com/search?q={}";
  yt = "https://www.youtube.com/results?search_query={}";

  repo = gh "repositories";

  nixo = "https://search.nixos.org/options?channel=unstable&query={}";
  nixp = "https://search.nixos.org/packages?channel=unstable&query={}";
}
