/*

To find out what packages are available for vscode/vscodium:

  nix-env -f "<nixpkgs>" -qaP -A vscode-extensions

*/
{ pkgs ? import <nixpkgs> {} }:

let
  extensions = (with pkgs.vscode-extensions; [
      # vspacecode.vspacecode
      bbenoist.nix
      ms-python.python
      # vspacecode.whichkey
      # ms-azuretools.vscode-docker
      haskell.haskell
      justusadam.language-haskell
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "remote-ssh-edit";
      publisher = "ms-vscode-remote";
      version = "0.47.2";
      sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
    }
  ];
in
  pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  }

