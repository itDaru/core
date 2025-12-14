{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    nmap
    git
    compose2nix
    gemini-cli
  ];
}
