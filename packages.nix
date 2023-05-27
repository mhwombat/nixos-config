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
#    (builtins.getFlake git+https://codeberg.org/mhwombat/hello-flake)
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
###    bind # for dig
###    binutils-unwrapped
###    # busybox DON'T USE! Overwrites realpath!
    chromium # X-only? See ozone?
###    csvkit
###    dialog
    direnv
###    dmidecode # system hardware info
###    dos2unix
###    ffmpeg
    firefox # X and wayland
    font-awesome # used by waybar
    foot # used by my sway config
    ghc
    gitAndTools.gitFull
    git-crypt
    git-lfs
    gimp # X and wayland
    globalprotect-openconnect # provides gpclient
###    gmp # GNU multiple precision arithmetic library
###    gnome.dconf-editor # X and wayland
###    gnome.eog # X and wayland
###    gnome.gnome-disk-utility # X and wayland
###    gnome.gucharmap # X and wayland
    gnumake
###    gnutls
###    gparted # X and wayland?
###    grim
###    hardinfo
       haskellPackages.haskell-language-server
###    haskellPackages.hls-call-hierarchy-plugin # for language server
###    haskellPackages.hls-class-plugin # for language server
###    haskellPackages.hls-eval-plugin # for language server
###    haskellPackages.hls-haddock-comments-plugin # for language server
###    haskellPackages.hls-hlint-plugin # for language server
###    haskellPackages.hls-pragmas-plugin # for language server
    haskellPackages.hls-stylish-haskell-plugin # for language server
###    haskellPackages.hls-tactics-plugin # for language server
###    hlint
    imagemagick
    imv
###    inetutils # provides telnet
    inkscape # X and wayland
###    jq # used by my sway-tree-launcher, but do I still use that?
###    killall
###    lftp
    libreoffice # X and wayland
###    librsvg # for including SVG in PDF
###    libsForQt5.okular
###    libsForQt5.spectacle # Buggy on wayland # replaced ksnapshot
###    libsForQt512.kcolorpicker
###    libwacom # graphics tablet works fine without this
###    lm_sensors
###    lsof
###    lshw
###    lua
###    lua52Packages.luacheck
    lua53Packages.lua-lsp
    meld # X and wayland
###    memtester
###    mkpasswd
###    ncompress
###    nerdfonts
       nix-direnv
###    nix-index # provides nix-locate
###    nix-prefetch-git
    onedrive
###    p7zip
    pandoc
###    pdfgrep
###    pdftk
    # podman enabled in containers.nix
###    poppler_utils # for pdfinfo
    # python
###    qpdfview # X and wayland
    qtile # X and wayland
###    recoll
    signal-desktop # X-only
###    slurp # wayland only, region selector
    starship
###    stylish-haskell
    # sway enabled in wayland.nix
    texlive.combined.scheme-full
#    textadept
    tree
###    unrar
    unzip
###    usbutils
    via
    vial
    # vistafonts # True-type fonts from MS Windows
###    vlc # X-only until I set QT environment
###    wacomtablet # graphics tablet works fine without this
    waybar # wayland only # used by my sway config (instead of swaybar)
    wdiff
    # wev # X and wayland, installed with sway by default
###    wf-recorder # wayland only
###    wget
    # wkhtmltopdf # depends on qtwebkit, which is broken as of 2022-11-30
    wl-clipboard # used by my sway config
    # xf86_input_wacom # graphics tablet works fine without this
###    xwayland
###    yad
###    zbar # for reading QR codes
    zip
  ];
}
