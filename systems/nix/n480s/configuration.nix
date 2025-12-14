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

    # --- Services ---
    modules.services.openssh
    modules.services.plasma
    modules.services.pipewire
    modules.services.xserver
    modules.services.virtualisation
  ];

nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
