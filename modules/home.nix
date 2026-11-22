{ config, pkgs, lib, ... }:

let
  dotsPath = ../dots; # Use ./dots if keeping home.nix in the root folder
in
{
  home.stateVersion = "25.11";

  xdg.configFile = lib.mapAttrs
    (name: type: {
      source = "${dotsPath}/${name}";
      recursive = type == "directory";
      force = true;
    })
    (builtins.readDir dotsPath);

  programs.home-manager.enable = true;
}