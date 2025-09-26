# In most cases, use $variable instead of ${variable}, otherwise Nix will try to expand it.
# We usually want bash to handle the expansion.
# There are a few exceptions where this isn't working as expected.
rec {
  # Keep home directories clean by using XDG locations
  XDG_CONFIG_HOME = "$HOME/.config";
  XDG_CACHE_HOME = "$HOME/.cache";
  XDG_DATA_HOME = "$HOME/.local/share";
  XDG_STATE_HOME = "$HOME/.local/state";

  # To see all keyboard layouts: localectl list-x11-keymap-layouts
  XKB_DEFAULT_LAYOUT = "ie,gr";
  # To see all keyboard variants: localectl list-x11-keymap-variants
  XKB_DEFAULT_VARIANT = "CloGaelach,";
  # To see all keyboard options: localectl list-x11-keymap-options
  # Configure Alt+CapsLock to switch between keyboard layouts.
  XKB_DEFAULT_OPTIONS = "compose:rctrl-altgr,grp:alt_caps_toggle";

  # XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority"; # xorg-auth
  # XCOMPOSEFILE = "$XDG_CONFIG_HOME/X11/xcompose"; # libX11
  # XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose"; # libX11
  STACK_ROOT = "${XDG_DATA_HOME}/stack"; # Stack
  LESSHISTFILE = "${XDG_CACHE_HOME}/history"; # less
  ZDOTDIR = "$XDG_CONFIG_HOME/zsh"; # zsh
  MOZ_ENABLE_WAYLAND = "1"; # enable wayland support in Firefox
  NIXOS_OZONE_WL = "1"; # enable wayland support in chromium and electron-based qapps
}

