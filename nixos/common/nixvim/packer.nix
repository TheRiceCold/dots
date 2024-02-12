{
  enable = true;
  plugins = [
    { 
      name = "Cassin01/wf.nvim"; 
      config = ''
        function() 
          require('wf').setup({
            theme = "default",
          })
        end
      '';
      }
  ];
}
