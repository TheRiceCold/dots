{ user, ... }:
{
  home-manager.users.${user} = {
    programs.rofi = {
      enable = true;
      theme = ./theme.rafi;
    };
  };
}
