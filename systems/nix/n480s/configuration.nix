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

    # --- Services ---
    modules.services.openssh
    modules.services.plasma
    modules.services.pipewire
    modules.services.xserver
    modules.services.virtualisation
  ];
}
