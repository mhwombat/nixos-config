{ mkDerivation, fetchgit, lib, base, pandoc, pandoc-types }:
mkDerivation {
  pname = "pandoc-columns";
  version = "0.2.0.1";
  src = fetchgit {
    url = "https://github.com/mhwombat/pandoc-columns.git";
    sha256 = "sha256-fRHVgk/Ni3CAP1FrYf9I7xU0T6Abv9KMZ8Mhrplgggc=";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base pandoc pandoc-types ];
  license = lib.licenses.publicDomain;
}
