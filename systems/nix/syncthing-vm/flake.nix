{
  description = "Syncthing-vm Flake with Modular Architecture";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      };

      containers = {
        syncthing    = import ./modules/containers/syncthing.nix;
      };
    };

    nixosConfigurations = {
      "syncthing-vm" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        specialArgs = { inherit inputs self; };
        
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
