{ pkgs, ... }:

{
  fonts = {
    fontconfig.enable = true;
    fontDir.enable    = true;
    fonts = with pkgs; [
      jetbrains-mono
      font-awesome     
      (nerdfonts.override {
        fonts = [ 
          "FiraCode"
          "JetBrainsMono" 
        ];
      })
    ];
  };
}
