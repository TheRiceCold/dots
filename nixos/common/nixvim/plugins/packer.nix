{
  enable = true;
  plugins = [
    { 
      name = "Cassin01/wf.nvim"; 
      # setup = '' '';
      config = ''
        function() 
          require('wf').setup {
            theme = "default",
          }
        end
      '';
    }
    { name = "LudoPinelli/comment-box.nvim"; }
  ];
}
