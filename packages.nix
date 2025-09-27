{ config, pkgs, options, inputs, ... }:

with pkgs;
{

###  nixpkgs.config.permittedInsecurePackages = [
###    "python3.10-kerberos-1.3.1"
###  ];

#  nixpkgs.overlays = [
#    (import ./overlays/default.nix)
#  ];

  # Packages I want to use
  environment.systemPackages = [
    #
    # My custom packages
    #
    # pkgs.amy-jot
    # pkgs.amy-textadept
    # inputs.hello-flake.packages."${pkgs.system}".default
    #
    # Standard packages
    #
    # alacritty # X and wayland
    aspell
    aspellDicts.en
    aspellDicts.en-computers
#    aspellDicts.en-science
    autotiling  # used by my sway config
    bemenu # used by my sway config
    brave
    # busybox DON'T USE! Overwrites realpath!
    chromium # X-only? See ozone?
    direnv
    # dolphin
    firefox # X and wayland
    foot # used by my sway config
    fuzzel
    ghc # required for haskell-language-server
    gitAndTools.gitFull
    git-crypt
    git-lfs
    gimp # X and wayland
    # globalprotect-openconnect # provides gpclient
    gnumake
    haskellPackages.haskell-language-server
#    haskellPackages.hls-stylish-haskell-plugin # for language server BROKEN on 2024-08-02
    hyprpicker # color picker, wayland
    imagemagick
    imv
    inkscape # X and wayland
    kdePackages.okular
    libreoffice # X and wayland
    litemdview
    meld # X and wayland
    nix-direnv
    nix-index # provides nix-locate
#    noson
    notmuch
    # onedrive
    pandoc
    # pdfslicer
    # for podman, see containers.nix
    # python
    # qtile # X and wayland
    recoll
    remind
    signal-desktop # X-only
    starship
    # sway enabled in wayland.nix
    textadept
    texlive.combined.scheme-full
    tree
    unzip
    # via
    # vial
    vlc
    waybar # wayland only # used by my sway config (instead of swaybar)
    wdiff
    # wev # X and wayland, installed with sway by default
    wl-clipboard # used by my sway config
    xfce.thunar
    xfce.tumbler
    zip
#    zoneminder
  ];
}
