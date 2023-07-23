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
        passwordeval = "cat /etc/nixos/secrets/msmtp";
        user = "amy@nualeargais.ie";
      };
    };
  };
}
