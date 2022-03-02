{ config, ... }:

{
  programs.sway = {
    enable = true;
  };

  programs.xwayland = {
    enable = true;
  };
}
