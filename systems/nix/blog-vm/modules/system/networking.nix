{ config, pkgs, ... }:
{
  networking.hostName = "syncthing-vm";
  networking.useDHCP = true;
  networking.firewall.enable = false;
  
  time.timeZone = "America/Montevideo";
  system.stateVersion = "25.05";
}
