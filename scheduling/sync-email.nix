{ config, pkgs, options, ... }:
with pkgs;
{
  # Sync email accounts
  systemd.timers."sync-email" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "1h";
        Unit = "sync-email.service";
      };
  };

  systemd.services."sync-email" = {
    path = [
      pkgs.offlineimap
    ];
    script = ''
      ${pkgs.bash}/bin/bash offlineimap
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "amy";
    };
  };
}
