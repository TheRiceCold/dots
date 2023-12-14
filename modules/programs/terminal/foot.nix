{ user, ... }:

{
  home-manager.users.${user} = {
    programs.foot.enable = true;
    xdg.configFile."foot/foot.ini".text = ''
      font=JetBrainsMonoNerdFont:size=7
      [colors]
      background=282828
      foreground=EBDBB2
    '';
  };
}
