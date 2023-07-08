{ config, pkgs, options, ... }:

with pkgs;
{

###  nixpkgs.config.permittedInsecurePackages = [
###    "python3.10-kerberos-1.3.1"
###  ];

  nixpkgs.overlays = [
    (import ./overlays/default.nix)
  ];

  # Packages I want to use
  environment.systemPackages = [
    #
    # My custom packages
    #
    pkgs.amy-jot
    pkgs.amy-textadept
    # (builtins.getFlake git+https://codeberg.org/mhwombat/hello-flake)
    # pkgs.pandoc-maths-web
    # pkgs.pandoc-linear-table
    # pkgs.pandoc-logic-proof
    # pkgs.pandoc-columns
    # pkgs.pandoc-select-code
    #
    # Standard packages
    #
    # alacritty # X and wayland
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    autotiling  # used by my sway config
    bemenu # used by my sway config
    # busybox DON'T USE! Overwrites realpath!
    chromium # X-only? See ozone?
    direnv
    firefox # X and wayland
    font-awesome # used by waybar
    foot # used by my sway config
    ghc
    gitAndTools.gitFull
    git-crypt
    git-lfs
    gimp # X and wayland
    # globalprotect-openconnect # provides gpclient
    gnumake
    haskellPackages.haskell-language-server
    haskellPackages.hls-stylish-haskell-plugin # for language server
    imagemagick
    imv
    inkscape # X and wayland
    libreoffice # X and wayland
    meld # X and wayland
    nix-direnv
    nix-index # provides nix-locate
    okular
    # onedrive
    pandoc
    # podman enabled in containers.nix
    # python
    qtile # X and wayland
    remind
    signal-desktop # X-only
    starship
    # sway enabled in wayland.nix
    texlive.combined.scheme-full
#    textadept
    tree
    unzip
    via
    vial
    # vistafonts # True-type fonts from MS Windows
    waybar # wayland only # used by my sway config (instead of swaybar)
    wdiff
    # wev # X and wayland, installed with sway by default
    wl-clipboard # used by my sway config
    zip
  ];
}
