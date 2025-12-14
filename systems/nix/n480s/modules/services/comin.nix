{ config, pkgs, ... }:

{
  services.comin = {
    enable = true;
    remotes = [{
      name = "origin"
      url = "https://github.com/itDaru/core/main?dir=systems/nix/n480s";
      branches.main.name = "main";
    }];
  };
}
