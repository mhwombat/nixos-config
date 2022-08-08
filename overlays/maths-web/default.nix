{ config, pkgs, stdenv, ... }:

stdenv.mkDerivation rec {
   name = "maths-web-${version}";
   version = "1.0.0";
   meta = {
      description = "web server for my maths stuff";
#       homepage = https://github.com/techieAgnostic/swatch/;
#       license = stdenv.lib.licenses.bsd3;
#       maintainers = [ "Thorn Avery - ta@p7.co.nz" ];
#       platforms = stdenv.lib.platforms.all;
   };
#    repoUrl = "https://raw.githubusercontent.com/techieAgnostic/swatch";
#    commit = "008f121290029a422af10328fc69f8f310cb19d5";
#    src = fetchurl {
#       url = "${repoUrl}/${commit}/swatch";
#       sha256 = "e373ab25e713eac78e5ea0647a3f511e1e21a635691d7167c9420cb838bf4d71";
#    };
   phases = "installPhase fixupPhase";
   installPhase = ''
      mkdir -p $out/bin
      echo 'hello wombat' > $out/bin/md2html
      chmod +x $out/bin/md2html
   '';
}
