{ config, pkgs, options, ... }:
#
# Documentation for systemd timer configuration:
#
#   https://nixos.wiki/wiki/Systemd/Timers
#   man systemd.timer   # general
#   man systemd.time    # time and date specification
#
# List active timers and their current state:
#
#   systemctl list-timers
#
# Manually invoke a service to test it:
#
#   sudo systemctl start sync-email
#
# Examine the log:
#
#   systemctl status sync-email
#
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
      ${pkgs.bash}/bin/bash /home/amy/kolab/sync
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "amy";
    };
  };

  # Email me about upcoming events
  systemd.timers."email-reminders" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "01:00";
        Persistent = "true";
        Unit = "email-reminders.service";
      };
  };

  systemd.services."email-reminders" = {
    path = [
      pkgs.remind
      pkgs.msmtp
    ];
    script = ''
      ${pkgs.bash}/bin/bash /home/amy/github/bin/upcoming | cat <(echo -e "Subject: Upcoming events\n") - | msmtp amy@nualeargais.ie
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "amy";
    };
  };
}
