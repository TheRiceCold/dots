{
  programs.nixvim.options = {
    # Set highlight on search
    hlsearch = true;

    # Make line numbers default
    number = true;
    relativenumber = true;

    # Enable break indent
    breakindent = true;

    # Save undo history
    undofile = true; 

    # Case insensitive searching UNLESS /C or capital in search
    ignorecase = true;
    smartcase = true;

    # Decrease update time
    updatetime = 100;
    signcolumn = "yes";

    clipboard = "unnamedplus";

    # Set completeopt to have a better completion experience
    completeopt = "menuone,noselect";

    backup = false;
    cmdheight = 1;
    showmode = false; # we don't need to see things like -- INSERT -- anymore
    showtabline = 1; # always show tabs
    smartindent = true;

    expandtab = true;
    autoindent = true;
    tabstop = 2;
    shiftwidth = 2;

    incsearch = true;
    wildmode = "list:longest";

    swapfile = false;
  };
}

