{ config, ... }:

{
  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };
  i18n = {
    defaultLocale = "en_IE.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Dublin";
}
