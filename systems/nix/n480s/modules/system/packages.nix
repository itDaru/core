{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    nmap
    git
    gemini-cli
  ];
}
