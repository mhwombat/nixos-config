THIS TEXT WILL CAUSE A SYNTAX ERROR, WHICH LETS ME KNOW THIS FILE IS BEING READ
{ mkDerivation, base, cmdargs, directory, fetchgit, filepath
, process, lib, time
}:
mkDerivation {
  pname = "jot";
  version = "1.4";
  src = fetchgit {
    url = "https://github.com/mhwombat/jot.git";
    sha256 = "1slnsh2jmqbhrsll6xlwa7nks35agmx2hrwxiy26shvnnfcv6m0d";
    rev = "006ac6d2d97e2cfdf42baa0e6d18dd9eb06c0c05";
    fetchSubmodules = true;
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base cmdargs directory filepath process time
  ];
  license = lib.licenses.publicDomain;
}