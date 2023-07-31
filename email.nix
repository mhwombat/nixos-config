{ config, ... }:

{
  programs.msmtp = {
    enable = true;
    defaults = {
      tls = true;
      port = 587;
    };
    accounts = {
      default = {
        auth = true;
        from = "amy@nualeargais.ie";
        host = "smtp.kolabnow.com";
        passwordeval = "cat /etc/nixos/secrets/msmtp"; # "msmtp" file is a one-line file containing the password
        user = "amy@nualeargais.ie";
      };
    };
  };
}
