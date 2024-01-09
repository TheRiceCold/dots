{
  programs.nixvim.plugins.lualine = {
    enable = true;
    ignoreFocus = ["NvimTree"];
    componentSeparators = { left = ""; right = ""; };
    sectionSeparators = { left = ""; right = ""; };
  };
}
