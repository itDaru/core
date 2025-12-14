{
  description = "N480s Flake with Modular Architecture";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    
    nixosModules = {
      system = {
        boot       = import ./modules/system/boot.nix;
        networking = import ./modules/system/networking.nix;
        users      = import ./modules/system/users.nix;
        packages   = import ./modules/system/packages.nix;
        nix-settings = import ./modules/system/nix-settings.nix;
      };

      desktop = {
        plasma     = import ./modules/desktop/plasma.nix;
        audio      = import ./modules/desktop/audio.nix;
      };

      services = {
        openssh       = import ./modules/services/openssh.nix;
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
