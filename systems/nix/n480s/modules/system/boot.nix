{ config, pkgs, ... }:
{
  imports = [
    ./../hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-b7238d5a-2da9-481c-b2d7-7e40c19fe8fe".device = "/dev/disk/by-uuid/b7238d5a-2da9-481c-b2d7-7e40c19fe8fe";
}
