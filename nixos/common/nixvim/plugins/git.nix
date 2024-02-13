{ pkgs, ... }:
{
  programs.nixvim = { 
    extraPlugins = with pkgs.vimPlugins; [ lazygit-nvim ];
    plugins = {
      # Git
      neogit = {
        enable = true;
        disableBuiltinNotifications = true;
      };
      gitsigns = { 
        enable = true; 
        currentLineBlame = true;
      };
    };
    extraConfigLua = "require('telescope').load_extension('lazygit')";
  };
}
