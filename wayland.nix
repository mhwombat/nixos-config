{ config, ... }:

{
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
