{ config, pkgs, ... }:
{
  networking.hostName = "n480s";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  time.timeZone = "Etc/GMT+3";
  system.stateVersion = "25.11";
}
