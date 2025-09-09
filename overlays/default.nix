final: prev: {
  amy-jot = final.haskellPackages.callPackage ./jot {};
  amy-textadept = final.libsForQt5.callPackage /home/amy/github/nixpkgs/pkgs/by-name/te/textadept/package.nix {};
  pandoc-linear-table = final.haskellPackages.callPackage ./pandoc-linear-table {};
  pandoc-logic-proof = final.haskellPackages.callPackage ./pandoc-logic-proof {};
  pandoc-columns = final.haskellPackages.callPackage ./pandoc-columns {};
  pandoc-select-code = final.haskellPackages.callPackage ./pandoc-select-code {};

  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev: {
    # Workaround for bug #437058
      i3ipc = python-prev.i3ipc.overridePythonAttrs (oldAttrs: {
        doCheck = false;
        checkPhase = ''
          echo "Skipping pytest in Nix build"
        '';
        installCheckPhase = ''
          echo "Skipping install checks in Nix build"
        '';
      });
    })
  ];
}
