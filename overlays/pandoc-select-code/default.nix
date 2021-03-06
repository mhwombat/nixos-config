{ mkDerivation, fetchgit, lib, base, pandoc, pandoc-types }:
mkDerivation {
  pname = "pandoc-select-code";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mhwombat/pandoc-select-code.git";
    sha256 = "sha256-5M8K6dlhEUyaKMvxs8ajhTdQl8IpxNUvU4ndJKc/Tw0=";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base pandoc pandoc-types ];
  license = lib.licenses.publicDomain;
}
