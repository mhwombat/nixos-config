{ config, pkgs, ... }:
{
  services.nginx.enable = true;
  services.nginx.virtualHosts."localhost" = {
      addSSL = false;
      enableACME = false;
      root = "/var/www/localhost";
  };
#   security.acme = {
#     acceptTerms = true;
#     defaults.email = "foo@bar.com";
#   };
}
