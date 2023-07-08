{ config, pkgs, options, ... }:

with pkgs;
{
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
      ${pkgs.bash}/bin/bash /home/amy/kolab/sync
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "amy";
    };
  };
}
