{ config, pkgs, options, ... }:
with pkgs;
{
  # Update recoll search index
  systemd.timers."recollindex" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "04:00";
        Persistent = "true";
        Unit = "recollindex.service";
      };
  };

  systemd.services."recollindex" = {
    path = [
      pkgs.recoll
    ];
    script = ''
      ${pkgs.recoll}/bin/recollindex
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "amy";
    };
  };
}
