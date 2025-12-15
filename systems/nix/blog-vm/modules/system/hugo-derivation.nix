{ config, pkgs, lib, ... }:

let
  hugoSrc = ../../../blog; # Assuming blog is at the root
in
{
  options.system.hugoSite = lib.mkOption {
    type = lib.types.package;
    description = "The built hugo site.";
    readOnly = true;
  };

  config = {
    system.hugoSite = pkgs.stdenv.mkDerivation {
      name = "hugo-blog-site";
      src = hugoSrc;
      nativeBuildInputs = [ pkgs.hugo ];

      # Hugo needs a writable HOME
      unpackPhase = ''
        cp -r --no-preserve=mode,ownership,timestamps ${hugoSrc} ./src
        chmod -R u+w ./src
        sourceRoot=./src
      '';

      buildPhase = ''
        export HOME=$(mktemp -d)
        hugo
      '';

      installPhase = ''
        mkdir -p $out
        cp -r public/* $out
      '';
    };
  };
}
