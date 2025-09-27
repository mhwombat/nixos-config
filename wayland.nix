{ config, ... }:

{
  programs.lightdm = {
    enable = true;
  };

  programs.xwayland = {
    enable = true;
  };

  programs.niri = {
    enable = true;
  };

  programs.sway = {
    enable = true;
  };

}
