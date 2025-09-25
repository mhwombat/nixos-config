{

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    hello-flake.url = git+https://codeberg.org/mhwombat/hello-flake;
  };

  outputs = { self, nixpkgs, ... }@inputs: {

    nixosConfigurations = {
      wombat11k = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = "x86_64-linux";
          hostname = "wombat11k";
          inherit inputs;
        };
        modules = [ ./configuration.nix ];
      };
    };

  };

}
