{ config, pkgs, ... }:
{
  services.nginx.enable = true;
  services.nginx.virtualHosts."localhost" = {
      addSSL = true;
      enableACME = true;
#      root = "/home/amy/github/eolas";
      root = "/home/amy/tech-experiments/pandoc-cgi";
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "foo@bar.com";
  };
}
