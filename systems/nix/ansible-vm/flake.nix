{
  description = "Ansible VM Flake with Modular Architecture";

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
        nix        = import ./modules/system/nix.nix;
      };

      services = {
        openssh    = import ./modules/services/openssh.nix;
        opensearch = import ./modules/services/opensearch.nix;
        grafana    = import ./modules/services/grafana.nix;
      };
    };

    nixosConfigurations = {
      "ansible-vm" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        specialArgs = { inherit inputs; };
        
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
