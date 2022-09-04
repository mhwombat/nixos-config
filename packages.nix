{ config, pkgs, options, ... }:

with pkgs;
{

  nixpkgs.config.permittedInsecurePackages = [
    "python3.10-kerberos-1.3.1"
  ];

  nixpkgs.overlays = [
    (import ./overlays/default.nix)
  ];

  # Packages I want to use
  environment.systemPackages = [
    #
    # My custom packages
    #
    pkgs.amy-jot
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
    autotiling # tiling for sway
    bash
    bemenu
    bibclean
    bibtool
    bibutils
    bind # for dig
    binutils-unwrapped
    # busybox DON'T USE! Overwrites realpath!
    # cabal2nix
    # cabal-install
    # cage # wayland, provides Xwayland to qtile
    chromium # X-only? See ozone?
    # clipman
    csvkit
    # curl
    dialog
    # diff-pdf
    # diffpdf
    direnv
    dmidecode # system hardware info
    dos2unix
    # (dwl.override { conf = /home/amy/.config/dwl/config.h; enable-xwayland = true; })
    # dzen2
    # (import ./emacs.nix { inherit pkgs; }) # X-only
    # (emacs.override { nativeComp = true; })
    evince # X and wayland
    # fbreader # X only. Binary is called "FBReader"
    ffmpeg
    firefox # X and wayland
    font-awesome
    foot
    # fzf
    # fzy
    # gcc
    # ghc
    # ghostscript # for pdf2dsc
    gitAndTools.gitFull
    git-crypt
    # (gitit.override { pluginSupport = true; })
    git-lfs
    gimp # Current version is X-only. Newer versions support wayland
    globalprotect-openconnect
    gmp # GNU multiple precision arithmetic library
    # gnome3.adwaita-icon-theme # to help meld?
    gnome3.dconf-editor # X and wayland
    gnome3.eog # X and wayland
    gnome3.gnome-disk-utility # X and wayland
    gnome3.gucharmap # X and wayland
    # gnome3.gnome-themes-extra # to fix "adwaita" bug
    gnumake
    gnutls
    gparted # X and wayland?
    graphviz
    grim
    hardinfo
    haskell-language-server
    # haskellPackages.brittany # for language server
    # haskellPackages.citeproc
    # haskellPackages.doi # broken as of 21.05
    # haskellPackages.floskell # for language server
    # haskellPackages.fourmolu # for language server
    # haskellPackages.ghcide # for language server
    # haskellPackages.haskell-language-server
    # haskellPackages.hasktags
    # haskellPackages.hlint
    # haskellPackages.hls-brittany-plugin # for language server
    haskellPackages.hls-call-hierarchy-plugin # for language server
    haskellPackages.hls-class-plugin # for language server
    haskellPackages.hls-eval-plugin # for language server
    # haskellPackages.hls-floskell-plugin # for language server
    # haskellPackages.hls-fourmolu-plugin # for language server
    haskellPackages.hls-haddock-comments-plugin # for language server
    haskellPackages.hls-hlint-plugin # for language server
    # haskellPackages.hls-ormolu-plugin # for language server
    haskellPackages.hls-pragmas-plugin # for language server
    haskellPackages.hls-stylish-haskell-plugin # for language server
    haskellPackages.hls-tactics-plugin # for language server
    # haskellPackages.ihaskell
    # haskellPackages.ormolu
    # haskellPackages.pandoc
    # haskellPackages.pandoc-citeproc # Deprecated in favour of haskellPackages.citeproc
    # haskellPackages.pandoc-crossref
    # haskellPackages.pandoc-filter-graphviz # broken as of 21.11?
    # haskellPackages.pandoc-types
    # haskellPackages.pandoc-include # broken as of 21.05
    # haskellPackages.stylish-cabal # for language server # broken as of 22.05
    # haskellPackages.stylish-haskell # for language server
    # helix
    hlint
    # hplip
    # hplipWithPlugin
    imagemagick
    imv
    inetutils # provides telnet
    inkscape # X and wayland
    # ispell
    jq # used by my sway-tree-launcher
    # kakoune
    kdiff3
    killall
    # kitty # X and wayland
    lftp
    libertine
    libreoffice # X and wayland
    librsvg # for including SVG in PDF
    libsForQt5.okular
    libsForQt5.spectacle # Buggy on wayland # replaced ksnapshot
    libsForQt512.kcolorpicker
    libwacom
    # libxml2 # for xmllint
    # liquidprompt
    lm_sensors
    lsof
    lshw
    lua
    lua52Packages.luacheck
    lua52Packages.lua-lsp
    # lxqt.qterminal # X and wayland
    meld # X and wayland
    memtester
    mkpasswd
    mustache-go
    ncompress
    nerdfonts
    nix-index # provides nix-locate
    nix-prefetch-git
    # nixos-generators
    # nodePackages.sloc
    # obsidian
    offlineimap
    onedrive
    openssl
    openconnect
    # opera # X and wayland, invoke with opera --enable-features=UseOzonePlatform --ozone-platform=wayland %U
    # ormolu
    p7zip
    pandoc
    pdfgrep
    pdftk
    # podman enabled in containers.nix
    poppler_utils # for pdfinfo
    # pup # for parsing HTML
    python
    # python3Env
    # python-language-server
    qpdfview # X and wayland
    qtile # X and wayland
    recoll
    # retext # markdown editor
    # selene
    signal-desktop # X-only
    slurp # wayland only, region selector
    # spaceship-prompt
    starship
    # stylish-cabal
    stylish-haskell
    # sway enabled in wayland.nix
    # sxiv # X-only
    # tabula # extract tables from PDF files
    texlive.combined.scheme-full
    textadept
    tree
    unrar
    unzip
    usbutils
    # vistafonts # True-type fonts from MS Windows
    vlc # X-only until I set QT environment
    wacomtablet
    waybar # wayland only
    # wayland-scanner
    # wayland-utils
    # wayland-protocols
    wdiff
    wev # X and wayland, installed with sway by default
    wf-recorder # wayland only
    wget
    wkhtmltopdf
    wl-clipboard
    wl-color-picker # wayland only
    wlr-randr
    wpa_supplicant
    # wshowkeys # wayland only
    # xf86_input_wacom
    xournal # X and wayland
    xwayland
    yad
    zbar # for reading QR codes
    zip
    # zsh
  ];
}
