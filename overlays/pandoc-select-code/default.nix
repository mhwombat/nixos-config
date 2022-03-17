{ mkDerivation, fetchgit, lib, base, pandoc, pandoc-types }:
mkDerivation {
  pname = "pandoc-select-code";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mhwombat/pandoc-select-code.git";
    sha256 = "sha256-gB4S2p0uzipul1BOnruzK9axT+xD/EdwBMsoaCY8MSg=";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base pandoc pandoc-types ];
  license = lib.licenses.publicDomain;
}
