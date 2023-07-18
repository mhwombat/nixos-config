{ config, ... }:

{
  # Enable CUPS to print documents.
  # For a printer that is IPP everywhere capable, this is all you need.
  # Turn the printer on, and CUPS will find it automatically.
  # No need to add the printer manually using the CUPS web UI.
  services.printing.enable = true;
  services.printing.extraConf = "sides=two-sided-long-edge";
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true; # Optional, for Wifi
}
