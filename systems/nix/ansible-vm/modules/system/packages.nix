{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ansible
    pipx
    openjdk17
    python311
  ];
}
