{ config, pkgs, inputs, ... }:

  # Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

let
  modules = inputs.self.nixosModules;
in
{
  imports = [
    ./hardware-configuration.nix

    # --- System Core ---
    modules.system.boot
    modules.system.networking
    modules.system.users
    modules.system.packages

    # --- Desktop Environment ---
    modules.desktop.plasma
    modules.desktop.audio

    # --- Services ---
    modules.services.openssh
    modules.services.virtualisation
  ];
}
