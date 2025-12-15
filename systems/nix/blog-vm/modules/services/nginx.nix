{ config, pkgs, ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts."_" = {
      root = config.system.hugoSite;
      extraConfig = ''
        index index.html;
      '';
    };
  };
}
