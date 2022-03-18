{ mkDerivation, fetchgit, lib, base, pandoc, pandoc-types }:
mkDerivation {
  pname = "pandoc-logic-proof";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mhwombat/pandoc-logic-proof.git";
    sha256 = "sha256-7VW24cWrZL4aV/aXk4rkjT4bZz08QMgeJGZfziAF7Uk=";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base pandoc pandoc-types ];
  license = lib.licenses.publicDomain;
}
