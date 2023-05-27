{ config, ... }:

{

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "ie";
    xkbVariant = "";

    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;

    # Enable the Cinnamon Desktop Environment.
    displayManager.lightdm.enable = true;
    desktopManager.cinnamon.enable = true;
  };

}
