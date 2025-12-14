{ config, pkgs, inputs, ... }:

let
  # Creamos el alias corto que querías
  modules = inputs.self.nixosModules;
in
{
  imports = [
    # Ahora puedes usar la sintaxis exacta que pediste:
    
    # --- System Core ---
    modules.system.boot
    modules.system.networking
    modules.system.users
    modules.system.packages

    # --- Services ---
    modules.services.openssh
    modules.services.opensearch
    modules.services.grafana
  ];
}
