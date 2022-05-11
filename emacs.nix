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
    pkgs.emacsPackages.base16-theme             # base16 theme schema
    pkgs.emacsPackages.company                  # COMplete ANYthing
    pkgs.emacsPackages.expand-region            # expand selections
    pkgs.emacsPackages.fill-column-indicator    # show fill column
    pkgs.emacsPackages.haskell-mode             # still needed, but not sure why
    pkgs.emacsPackages.hydra                    # key binding families
    pkgs.emacsPackages.lsp-haskell              # LSP for Haskell
    pkgs.emacsPackages.lsp-mode                 # LSP (Language Server Protocol)
    pkgs.emacsPackages.lsp-ui                   # Extra LSP stuff
    pkgs.emacsPackages.lv                       # hints for hydra
    pkgs.emacsPackages.markdown-mode            # Markdown editing mode
    pkgs.emacsPackages.undo-tree                # Undo/redo that behaves like other apps
    pkgs.emacsPackages.vertico                  # Completions
    pkgs.emacsPackages.yasnippet                # Used by company
  ])
