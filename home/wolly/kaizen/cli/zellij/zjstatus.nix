{ stdenv, fetchurl, ... }:

stdenv.mkDerivation {
  name = "zjstatus";
  src = fetchurl {
    url = "https://github.com/dj95/zjstatus/releases/download/v0.13.1/zjstatus.wasm";
    sha256 = "1a42nx5ayvjkbfz4rkq5bc5nn8jhr10y2hcvh4zw749prl3xdxzb";
  };
  installPhase = ''
    mkdir -p $out
    cp $src $out/
  '';
}
