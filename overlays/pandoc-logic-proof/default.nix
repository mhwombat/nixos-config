{ mkDerivation, fetchgit, lib, base, pandoc, pandoc-types }:
mkDerivation {
  pname = "pandoc-logic-proof";
  version = "0.2.0.1";
  src = fetchgit {
    url = "https://github.com/mhwombat/pandoc-logic-proof.git";
    sha256 = "sha256-4jSKolMIYK1cphssERuh9+Dz6BleidaBZQA7OTZwMO0=";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base pandoc pandoc-types ];
  license = lib.licenses.publicDomain;
}
