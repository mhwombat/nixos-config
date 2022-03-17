{ config, pkgs, options, hello-haskell-flake, jot, pandoc-select-code, ... }:

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
    jot
    pandoc-select-code
    # Standard packages
    alacritty # X and wayland
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    autotiling
    base16-builder
    base16-shell-preview
    base16-universal-manager
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
    calibre # X and wayland
    chromium # X-only? See ozone?
    clipman
    colorls
    csvkit
    curl
    dialog
    diff-pdf
    diffpdf
    direnv
    dmenu # X-only
    dmenu-wayland
    dmidecode # system hardware info
    dos2unix
    # (dwl.override { conf = /home/amy/.config/dwl/config.h; enable-xwayland = true; })
    dzen2
    (import ./emacs.nix { inherit pkgs; }) # X-only
    # (enlightenment.enlightenment.override { waylandSupport = true; })
    evince # X and wayland
    exa
    fbreader # X only. Binary is called "FBReader"
    file
    firefox # X and wayland
    # firefox-wayland
    flameshot
    font-awesome
    foot
    fzf
    fzy
    gcc
    gcolor3
    ghc
    ghostscript # for pdf2dsc
    gitAndTools.gitFull
    git-crypt
    gitit
    git-lfs
    gimp # Current version is X-only. Newer versions support wayland
    # glabels
    globalprotect-openconnect
    gmp # GNU multiple precision arithmetic library
    gnome3.adwaita-icon-theme # to help meld?
    gnome3.dconf-editor # X and wayland
    gnome3.eog # X and wayland
    gnome3.gnome-disk-utility # X and wayland
    gnome3.gucharmap # X and wayland
    # gnome3.librsvg # for rsvg-convert Bug in unstable 21 jan 2022
    gnome3.gnome-themes-extra # to fix "adwaita" bug
    gnumake
    gnupg
    gnutls
    go
    gparted # X and wayland?
    graphviz
    grim
    hardinfo
    haskell-language-server
    haskellPackages.cabal-fmt
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
    # haskellPackages.rasa # broken as of 21.05
    # haskellPackages.stylish-cabal # broken as of 21.05
    haskellPackages.stylish-haskell
    haskellPackages.template
    # haskellPackages.X11-xft
    havoc
    hikari
    howl
    hplip
    hplipWithPlugin
    # i3status-rust
    idris
    ihaskell
    imagemagick
    imv
    inetutils # provides telnet
    inkscape # X and wayland
    # iosevka # font
    ispell
    jq # json analyser
    jupyter
    killall
    # kitty # X and wayland
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
    most # alternative to "less"
    mupdf # X-only
    mustache-go
    ncompress
    nix-index # provides nix-locate
    nix-prefetch-git
    nixos-generators
    nnn
    nodePackages.sloc
    offlineimap
    onedrive
    openssl
    opera # X and wayland, invoke with opera --enable-features=UseOzonePlatform --ozone-platform=wayland %U
    p7zip
    pandoc
    pdfgrep
    pdftk
    pkg-config # temporary, trying to build some 3rd party code
    plan9port
    plantuml
    # podman enabled in containers.nix
    poppler_utils # for pdfinfo
    pup # for parsing HTML
    python
    # python2Env
    python3Env
    qpdfview # X and wayland
    qtile # X and wayland
    # rEnv
    ristate
    river
    rootbar
    rsync
    samba
    signal-desktop # X-only
    slurp
    spaceship-prompt
    stack
    swappy
    # sway enabled in wayland.nix
    sxiv # X-only
    tabula # extract tables from PDF files
    # tectonic
    texlive.combined.scheme-full
    thunderbird # X and wayland
    tree
    ugrep
    unrar
    unzip
    usbutils
    vistafonts # True-type fonts from MS Windows
    vlc # X-only until I set QT environment
    # vmware-horizon-client
    wacomtablet
    waybar
    wayland-scanner
    wayland-utils
    wayland-protocols
    wev # X and wayland, installed with sway by default
    wget
    wl-clipboard
    wlr-randr
    wofi
    wpa_supplicant
    # x11
    xcolor
    xdg-launch
    xdg-utils
    xf86_input_wacom
    xqilla
    xmlstarlet
    xmobar
    # xmonad-with-packages
    # xorg.libX11
    # xorg.libXft
    xorg.xev # X-only, use wev instead
    xournal
    xscreensaver # X-only
    xsel # X-only, use wl-clipboard's wl-copy and wl-paste instead
    xwayland
    yad
    # yambar
    # (yambar.override { x11Support = false; waylandSupport = true; })
    # yed
    zbar # for reading QR codes
    zip
    zsh
  ];
}
