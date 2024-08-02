
Documentation for systemd timer configuration:

    https://nixos.wiki/wiki/Systemd/Timers
    man systemd.timer   # general
    man systemd.time    # time and date specification

List active timers and their current state:

    systemctl list-timers

Manually invoke a service to test it:

    sudo systemctl start sync-email

Examine the log:

    systemctl status sync-email

