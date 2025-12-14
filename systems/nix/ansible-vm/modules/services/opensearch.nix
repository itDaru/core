{ config, pkgs, ... }:
{
  services.opensearch = {
    enable = true;
    settings."network.host" = "0.0.0.0";
  };
}
