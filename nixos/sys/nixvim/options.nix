{
  programs.nixvim.options = {
    backup = false;
    clipboard = "unnamedplus";
    cmdheight = 1;
    ignorecase = true;
    showmode = false; # we don't need to see things like -- INSERT -- anymore
    showtabline = 1; # always show tabs
    smartcase = true;
    smartindent = true;

    updatetime = 100; # Faster completion

    number = true;
    relativenumber = true;

    autoindent = true;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;

    incsearch = true;
    wildmode = "list:longest";

    swapfile = false;
    undofile = true; # Build-in persistent undo
  };
}

