{ mkDerivation, fetchgit, lib, base, pandoc, pandoc-types }:
mkDerivation {
  pname = "pandoc-linear-table";
  version = "0.2.0.2";
  src = fetchgit {
    url = "https://github.com/mhwombat/pandoc-linear-table.git";
    sha256 = "sha256-kAxwcYgJE6G5AyQWV5wbFziqO0MWoqruTHgKItJ5vLQ=";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base pandoc pandoc-types ];
  license = lib.licenses.publicDomain;
}
