{ config, pkgs, ... }:

{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
      firefox-esr
      librewolf
      bitwarden-desktop
      keepassxc
      virt-manager
    ];
  };
}
