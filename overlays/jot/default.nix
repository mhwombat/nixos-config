{ mkDerivation, base, cmdargs, directory, fetchgit, filepath
, process, lib, time
}:
mkDerivation {
  pname = "jot";
  version = "1.4";
  src = fetchgit {
    url = "https://github.com/mhwombat/jot.git";
    sha256 = "sha256-CXZmtMhqvAu+A0/FeEyoWdNAZSUOYwUK1RXXfMQb+6g=";
    fetchSubmodules = true;
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base cmdargs directory filepath process time
  ];
  license = lib.licenses.publicDomain;
}