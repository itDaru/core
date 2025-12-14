{ config, pkgs, ... }:
{
  users.users.amurana = {
    isNormalUser = true;
    description = "amurana";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
