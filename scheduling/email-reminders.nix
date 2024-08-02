{ config, pkgs, options, ... }:
with pkgs;
{
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
