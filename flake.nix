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
        modules =
	  [
            ./base.nix
	    ./shannagh-wifi.nix
            ./scheduling/sync-email.nix
            ./scheduling/email-reminders.nix
	    ./scheduling/recollindex.nix
	  ];
      }; # wombat11k

      sage = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = "x86_64-linux";
          hostname = "sage";
          inherit inputs;
        };
        modules =
	  [
            ./base.nix
	    ./shannagh-wifi.nix
	  ];
      }; # sage

    }; # nixosConfigurations

  };

}
