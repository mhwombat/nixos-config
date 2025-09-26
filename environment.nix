{ config, ... }:

{

  # These variables end up in /etc/set-environment.
  # They may not take effect until you log out and back in again.
  environment.variables = {
    # In most cases, use $variable instead of ${variable}, otherwise Nix will try to expand it.
    # We usually want bash to handle the expansion.
    # There are a few exceptions where this isn't working as expected.

    # Keep home directories clean by using XDG locations
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    # XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority"; # xorg-auth
    # XCOMPOSEFILE = "$XDG_CONFIG_HOME/X11/xcompose"; # libX11
    # XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose"; # libX11
    LESSHISTFILE = "$XDG_CACHE_HOME/history"; # less
    MOZ_ENABLE_WAYLAND = "1"; # enable wayland support in Firefox
    NIXOS_OZONE_WL = "1"; # enable wayland support in chromium and electron-based qapps
  };


  environment.shellAliases = {
    ahgrep = "all-history | grep";
    cb = "cabal build --ghc-options=-Werror";
    cbt = "cabal build --ghc-options=-Werror && cabal test";
    cbti = "cabal build --ghc-options=-Werror && cabal test && cabal install --installdir=.";
    cfresh = "cabal check ; cabal outdated ; cabal --disable-nix gen-bounds";
    chd = "cabal haddock --haddock-for-hackage";
    cu = "cabal upload -u AmyDeBuitleir -p";
    cud = "cabal upload --documentation -u AmyDeBuitleir -p";
    eod = "git-summary ~/github ; git-summary ~/codeberg";
    ff = "firefox --new-window";
    ffzy = "find ~ -type f | fzy";
    grep-non-ascii = "grep --color='\''auto'\'' -P -n '\''[\x80-\xFF]'\''";
    hackage-up = "/home/amy/github/criptithe/encrypted/bin/hackage-up";
    hgrep = "history | grep";
    l = "ls -alh";
    ll = "ls -l";
    longestLine = "awk '\''{ if (length($0) > max) {max = length($0); maxline = $0} } END { print maxline }'\''";
    ls = "ls --color=tty";
    lsexe = "find . -maxdepth 1 -type f -executable";
    nfi = "nix flake init -t github:serokell/templates#haskell-cabal2nix";
    ods = "onedrive --synchronize";
    passgen = "/home/amy/github/criptithe/encrypted/bin/passgen";
    # pick-colour = "grim -g $(slurp -p) -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:-";
    psgrep = "ps -ef | grep";
    remedit = "nano ~/.config/remind/private.rem";
    roll = "format-zpl | lpr -P Zebra -o raw";
    run-dwl = "dwl > dwl.log 2>&1";
    run-hikari = "hikari > hikari.log 2>&1";
    run-qtile = "qtile start -b wayland > qtile.log 2>&1";
    run-river = "river > river.log 2>&1";
    run-sway = "rm -f sway.log.backup ; mv sway.log sway.log.backup 2>/dev/null ; sway > sway.log 2>&1";
    # snap = "grim -g '$(slurp)'';
    sncg = "sudo nix-collect-garbage --delete-older-than 20d";
    snrsu = "sudo nixos-rebuild switch --upgrade";
    snrsui = "sudo nixos-rebuild switch --upgrade -I nixpkgs=/home/amy/github/nixpkgs";
    tad = "textadept --force --nosession --userhome $XDG_CONFIG_HOME/textadept";
    wdf = "wdiff -n -w $'\033[30;41m' -x $'\033[0m' -y $'\033[30;42m' -z $'\033[0m'";
  };

  # should I add...
  # alias l='ls -alh'
  # alias ll='ls -l'
  # alias ls='ls --color=tty'

# this stuff isn't posix-compliant, and it's not getting picked up by bash
#   environment.shellInit = ''
#     #
#     # functions
#     #
#     function fadoc0() { find "''${1:-.}" -name "*.adoc0" -print | sort ;}
#     function fadoc() { find "''${1:-.}" -name "*.adoc" -print | sort ;}
#     function fex() { find "''${1:-.}" -executable -type f ;}
#     function fhs() { find "''${1:-.}" -name dist-newstyle -prune -o -name "*.hs" -print | sort ;}
#     function fipynb() { find "''${1:-.}" -name "*.ipynb" | grep -v ipynb_checkpoints | sort ;}
#     function flua() { find "''${1:-.}" -name "*.lua" -print | sort ;}
#     function fmd() { find "''${1:-.}" -name "*.md" | sort ;}
#     function gic() { git add $*; git commit -m "initial commit" $* ;}
#     function next() { remind -n ~/.config/remind $1 | sort; }
#     function nghci() { nix-shell -p "haskellPackages.ghcWithPackages (p: [$*])" --run ghci ;}
#     function ngrep() { grep -i $* ''${HOME}/github/notes/* ;}
#     function qc() { grep prop_ $* | grep "∷" | sed "s/ ∷.*//; s/\(.*\)/    testProperty "\1"\n      \1,/" ;}
#     function sadoc0 { fadoc0 $2 | xargs grep "$1" ;}
#     function sadoc { fadoc $2 | xargs grep "$1" ;}
#     function shs { fhs $2 | xargs grep "$1" ;}
#     function sipynb { fipynb $2 | xargs grep "$1" ;}
#     function slua { flua $2 | xargs grep "$1" ;}
#     function smd { fmd $2 | xargs grep "$1" ;}
#     function stylish { stylish-haskell --inplace --recursive "''${1:-.}" ;}
#
#     # cat-until PATTERN FILE
#     #     Prints FILE up to the first line that matches PATTERN
#     function cat-until { sed -n "1,/$1/ p" "$2" ;}
#   '';

#  programs.direnv.enable = true;
}
