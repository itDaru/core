{
  description = "n480s Flake with Modular Architecture";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {

    nixosModules = {
      system = {
        boot       = import ./modules/system/boot.nix;
        networking = import ./modules/system/networking.nix;
        users      = import ./modules/system/users.nix;
        packages   = import ./modules/system/packages.nix;
        nix        = import ./modules/system/nix.nix;
      };

      services = {
        openssh    = import ./modules/services/openssh.nix;
        netbird    = import ./modules/services/netbird.nix;
        plasma     = import ./modules/services/plasma.nix;
        pipewire   = import ./modules/services/pipewire.nix;
        xserver    = import ./modules/services/xserver.nix;
        virtualisation = import ./modules/services/virtualisation.nix;
      };
    };

    nixosConfigurations = {
      "n480s" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        specialArgs = { inherit inputs; };
        
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
