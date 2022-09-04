final: prev: {
  amy-jot = final.haskellPackages.callPackage ./jot {};
  pandoc-linear-table = final.haskellPackages.callPackage ./pandoc-linear-table {};
  pandoc-logic-proof = final.haskellPackages.callPackage ./pandoc-logic-proof {};
  pandoc-columns = final.haskellPackages.callPackage ./pandoc-columns {};
  pandoc-select-code = final.haskellPackages.callPackage ./pandoc-select-code {};
  # pandoc-server = final.haskellPackages.callPackage ./pandoc-server {};
}
