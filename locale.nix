{ config, ... }:

{
  # Configure console keymap
  console.keyMap = "ie";

  i18n = {
    defaultLocale = "en_IE.UTF-8";
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_IE.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Dublin";

  # These variables end up in /etc/set-environment.
  # They may not take effect until you log out and back in again.
  environment.variables = {
    # To see all keyboard layouts: localectl list-x11-keymap-layouts
    XKB_DEFAULT_LAYOUT = "ie,gr";
    # To see all keyboard variants: localectl list-x11-keymap-variants
    XKB_DEFAULT_VARIANT = "CloGaelach,";
    # To see all keyboard options: localectl list-x11-keymap-options
    # Configure Alt+CapsLock to switch between keyboard layouts.
    XKB_DEFAULT_OPTIONS = "compose:rctrl-altgr,grp:alt_caps_toggle";
  };

}
