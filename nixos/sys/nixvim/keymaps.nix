{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>bn";
      action = ":bnext<CR>";
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = ":bprev<CR>";
    }
    {
      mode = "n";
      key = "<leader>c";
      action = ":bdelete<CR>";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = ":NvimTreeToggle<CR>";
    }
  ];
}
