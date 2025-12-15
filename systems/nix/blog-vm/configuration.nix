{ config, pkgs, inputs, ... }:

let
  modules = inputs.self.nixosModules;
in
{
  imports = [
    
    # --- System Core ---
    modules.system.boot
    modules.system.networking
    modules.system.users
    modules.system.packages
    modules.system.nix
    modules.system.hugo-derivation

    # --- Services ---
    modules.services.openssh
    modules.services.nginx
  ];
}
