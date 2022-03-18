final: prev: {
  jot = final.haskellPackages.callPackage ./jot {};
  pandoc-select-code = final.haskellPackages.callPackage ./pandoc-select-code {};
  pandoc-logic-proof = final.haskellPackages.callPackage ./pandoc-logic-proof {};
}