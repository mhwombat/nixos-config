{ config, ... }:

{
  services.xserver = {
    enable = true;
    layout = "ie";

    # # XMonad
    # windowManager.xmonad = {
    #   enable = true;
    #   enableContribAndExtras = true;
    #   extraPackages = haskellPackages: [
    #     # haskellPackages.xmonad_0_17_0
    #     # haskellPackages.xmonad-contrib_0_17_0
    #     # haskellPackages.xmonad-extras_0_17_0
    #     haskellPackages.xmonad
    #     haskellPackages.xmonad-contrib
    #     haskellPackages.xmonad-extras
    #   ];
    # };

    windowManager.qtile = {
      enable = true;
    };
  
    # Enable the KDE Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

#  # Enable the Plasma 5 Desktop Environment.
#  services.xserver.displayManager.sddm.enable = true;
#  services.xserver.desktopManager.plasma5.enable = true;
};

}
