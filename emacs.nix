/*
See the example at
https://nixos.org/manual/nixos/stable/index.html#module-services-emacs

To find out what packages are available for Emacs:

  nix-env -f "<nixpkgs>" -qaP -A emacsPackagesNg.elpaPackages
  nix-env -f "<nixpkgs>" -qaP -A emacsPackagesNg.melpaPackages
  nix-env -f "<nixpkgs>" -qaP -A emacsPackagesNg.melpaStablePackages
  nix-env -f "<nixpkgs>" -qaP -A emacsPackagesNg.orgPackages

*/
{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesFor myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: [
    pkgs.emacs27Packages.base16-theme             # base16 theme schema
    pkgs.emacs27Packages.company                  # COMplete ANYthing
    pkgs.emacs27Packages.expand-region            # expand selections
    pkgs.emacs27Packages.fill-column-indicator    # show fill column
    pkgs.emacs27Packages.haskell-mode             # still needed?
    pkgs.emacs27Packages.hydra                    # key binding families
    pkgs.emacs27Packages.lsp-haskell              # LSP for Haskell
    pkgs.emacs27Packages.lsp-mode                 # LSP (Language Server Protocol)
    pkgs.emacs27Packages.lsp-ui                   # Extra LSP stuff
    pkgs.emacs27Packages.lv                       # hints for hydra
    pkgs.emacs27Packages.markdown-mode            # Markdown editing mode
    pkgs.emacs27Packages.undo-tree                # Undo/redo that behaves like other apps
    pkgs.emacs27Packages.vertico                  # Completions
    pkgs.emacs27Packages.yasnippet                # Used by company
  ])
