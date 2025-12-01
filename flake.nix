{

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    # hello-flake.url = git+https://codeberg.org/mhwombat/hello-flake;
    wombat-themer.url = git+https://codeberg.org/mhwombat/wombat-themer;
  };

  outputs = { self, nixpkgs, ... }@inputs: {

    nixosConfigurations = {

      wombat11k = let hostnameNew = "wombat11k"; in nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules =
          [
            { nixpkgs.hostPlatform = "x86_64-linux"; }
            { networking.hostName = "${hostnameNew}"; }
            (./. + "/${hostnameNew}-hardware-configuration.nix")
            (./. + "/${hostnameNew}.nix")
            ./base.nix
            ./shannagh-wifi.nix
            ./scheduling/sync-email.nix
            ./scheduling/email-reminders.nix
            ./scheduling/recollindex.nix
          ];
      }; # wombat11k

      sage = let hostnameNew = "sage"; in nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules =
          [
            { nixpkgs.hostPlatform = "x86_64-linux"; }
            { networking.hostName = "${hostnameNew}"; }
            (./. + "/${hostnameNew}-hardware-configuration.nix")
            (./. + "/${hostnameNew}.nix")
            ./base.nix
            ./shannagh-wifi.nix
          ];
      }; # sage

    }; # nixosConfigurations

  };

}
