{
  programs.nixvim = {
    extraConfigLua = ''

    '';

    plugins.nvim-tree = {
      enable = true;
      # extraConfigLua = '' '';
      openOnSetupFile = true;
      renderer = {
        addTrailing = false;
        groupEmpty = false;
        highlightGit = false;
        fullName = false;
        highlightOpenedFiles = "none";
        rootFolderLabel = ":t";
        indentWidth = 2;
        indentMarkers = {
          enable = false;
          inlineArrows = true;
          icons = {
            corner = "└";
            edge = "│";
            item = "│";
            none = " ";
          };
        };
        icons = {
          padding = " ";
          symlinkArrow = " ➛ ";
          gitPlacement = "before";
        };
      };

      updateFocusedFile = {
        enable = true;
        updateRoot = true;
        # ignoreList = {};
        # debounceDelay = 15;
      };

      diagnostics = {
        enable = true;
        showOnDirs = false;
        showOnOpenDirs = false;
        debounceDelay = 50;
        severity = { };
        icons = { 
          hint = "󰌶";
          info = "";
          warning = "";
          error = "";
        };
      };
    };
  };
}
