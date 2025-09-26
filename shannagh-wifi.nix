{ config, pkgs, ... }:

{

  networking = {
    networkmanager.enable = false; # can't use with networking.wireless

    wireless = {
      enable = true;  # Enables wireless support via wpa_supplicant.
      userControlled.enable = true; # enable use of wpa_cli (or wpa_gui if you install wpa_supplicant_gui)
      networks = {
        # pskRaw is generated with the command: wpa_passphrase SSID password
#        "vodafone4806D2".pskRaw = "e7f79c45987c0ca510a19b3600ae34f4df8046db3d7e789f789ea6b2f7aa518c";
        "TeachMeabhair".pskRaw = "016cc86f010caae89e62ebeb79e9ab4fb3f22d932b1a402ef6d6e1604fbee71f";
      };
    }; # wireless
  };

}
