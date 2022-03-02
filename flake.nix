{
  description = "My NixOS Configuration";
  
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    agenix.url = "github:ryantm/agenix";

    # My flakes
    hello-nix-flake.url = github:mhwombat/hello-nix-flake;
    jot.url = github:mhwombat/jot;
    pandoc-select-code.url = github:mhwombat/pandoc-select-code;
  };
  
  outputs = { self, nixpkgs, hello-nix-flake, jot, pandoc-select-code, ... }: {
    nixosConfigurations = {
      wombat11k = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
            hello-nix-flake.nixosModules.hello
            ./configuration.nix
          ];
      };
    };
  };
}
