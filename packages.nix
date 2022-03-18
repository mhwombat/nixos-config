{ config, pkgs, options, ... }:

with pkgs;
{

  nixpkgs.config.permittedInsecurePackages = [
    "nodejs-10.24.1"
  ];

  nixpkgs.overlays = [
    (import ./overlays/default.nix)
  ];

  # Packages I want to use
  environment.systemPackages = [
    # My custom packages
    pkgs.jot
    pkgs.pandoc-select-code
    pkgs.pandoc-logic-proof
    # Standard packages
    alacritty # X and wayland
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    autotiling
    bash
    bemenu
    bibclean
    bibtool
    bibutils
    bind # for dig
    binutils-unwrapped
    # busybox overwrites realpath!
    cabal2nix
    cabal-install
    cage # wayland, provides Xwayland to qtile
    chromium # X-only? See ozone?
    clipman
    csvkit
    curl
    dialog
    diff-pdf
    diffpdf
    direnv
    dmidecode # system hardware info
    dos2unix
    # (dwl.override { conf = /home/amy/.config/dwl/config.h; enable-xwayland = true; })
    dzen2
    (import ./emacs.nix { inherit pkgs; }) # X-only
    evince # X and wayland
    fbreader # X only. Binary is called "FBReader"
    firefox # X and wayland
    font-awesome
    fzf
    fzy
    gcc
    ghc
    ghostscript # for pdf2dsc
    gitAndTools.gitFull
    git-crypt
    git-lfs
    gimp # Current version is X-only. Newer versions support wayland
    # globalprotect-openconnect
    gmp # GNU multiple precision arithmetic library
    gnome3.adwaita-icon-theme # to help meld?
    gnome3.dconf-editor # X and wayland
    gnome3.eog # X and wayland
    gnome3.gnome-disk-utility # X and wayland
    gnome3.gucharmap # X and wayland
    gnome3.gnome-themes-extra # to fix "adwaita" bug
    gnumake
    gnutls
    gparted # X and wayland?
    graphviz
    hardinfo
    haskell-language-server
    haskellPackages.citeproc
    # haskellPackages.doi # broken as of 21.05
    haskellPackages.ghcide # for language server
    haskellPackages.haskell-language-server
    haskellPackages.hasktags
    haskellPackages.hlint
    haskellPackages.hls-call-hierarchy-plugin # for language server
    haskellPackages.hls-class-plugin # for language server
    haskellPackages.hls-eval-plugin # for language server
    haskellPackages.hls-haddock-comments-plugin # for language server
    haskellPackages.hls-hlint-plugin # for language server
    haskellPackages.hls-pragmas-plugin # for language server
    haskellPackages.hls-tactics-plugin # for language server
    # haskellPackages.ihaskell
    haskellPackages.pandoc
    haskellPackages.pandoc-crossref
    haskellPackages.pandoc-types
    # haskellPackages.pandoc-include # broken as of 21.05
    hplip
    hplipWithPlugin
    imagemagick
    imv
    inetutils # provides telnet
    inkscape # X and wayland
    ispell
    killall
    kitty # X and wayland
    lftp
    libertine
    libreoffice # X and wayland
    libsForQt5.okular
    libsForQt5.spectacle # Buggy on wayland # replaced ksnapshot
    libsForQt512.kcolorpicker
    libwacom
    libxml2 # for xmllint
    lm_sensors
    lsof
    lshw
    lxqt.qterminal # X and wayland
    meld # X and wayland
    memtester
    mkpasswd
    mustache-go
    ncompress
    nix-index # provides nix-locate
    nix-prefetch-git
    # nixos-generators
    nodePackages.sloc
    offlineimap
    onedrive
    openssl
    # opera # X and wayland, invoke with opera --enable-features=UseOzonePlatform --ozone-platform=wayland %U
    p7zip
    pandoc
    pdfgrep
    pdftk
    # podman enabled in containers.nix
    poppler_utils # for pdfinfo
    # pup # for parsing HTML
    python
    python3Env
    qpdfview # X and wayland
    qtile # X and wayland
    signal-desktop # X-only
    slurp
    spaceship-prompt
    # sway enabled in wayland.nix
    sxiv # X-only
    # tabula # extract tables from PDF files
    texlive.combined.scheme-full
    tree
    unrar
    unzip
    usbutils
    vistafonts # True-type fonts from MS Windows
    vlc # X-only until I set QT environment
    wacomtablet
    waybar
    wayland-scanner
    wayland-utils
    wayland-protocols
    wev # X and wayland, installed with sway by default
    wget
    wl-clipboard
    wlr-randr
    wpa_supplicant
    # xf86_input_wacom
    xournal # X and wayland
    xwayland
    yad
    zbar # for reading QR codes
    zip
    zsh
  ];
}
