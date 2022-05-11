{ mkDerivation, fetchgit, lib, base, aeson, hspec, hspec-wai, hspec-wai-json, http-types, pandoc, servant-server, text, wai, wai-extra, wai-logger, warp }:
mkDerivation {
  pname = "pandoc-server";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/jgm/pandoc-server.git";
    sha256 = "sha256-lsmHfwQfbdDSUwrSKqUbqdgBFjFrQVmfDefBaHDlG3k=";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base aeson hspec hspec-wai hspec-wai-json http-types pandoc servant-server text wai wai-extra wai-logger warp ];
  license = lib.licenses.publicDomain;
}
