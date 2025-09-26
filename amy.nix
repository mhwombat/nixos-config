{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "amy";
  home.homeDirectory = "/home/amy";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

# .bashrc
# .bash_profile
# .cabal/config
# .config/shell-agnostic
# .config/foot/foot.ini
# .config/foot/colours.ini
# .config/git/config
# .config/git/gitignore
# .config/offlineimap/config
# .config/recoll/recoll.conf
# .config/recoll/mimemap
# .config/remind
# .config/starship
# .config/textadept/init.lua
# .config/textadept/themes/base16-amy.lua
# .config/sway
# .config/waybar/config
# .config/waybar/style.css
# .ghci
