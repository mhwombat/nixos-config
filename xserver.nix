{ config, ... }:

{

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "ie";
    xkbVariant = "";

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

}
