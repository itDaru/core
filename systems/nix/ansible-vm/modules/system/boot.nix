{ config, pkgs, ... }:
{
  imports = [ /etc/nixos/hardware-configuration.nix ]; # Impure path

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
