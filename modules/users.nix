{ config, pkgs, ... }:

{
  networking.hostName = "raed";

  # Primary admin user
  users.users.raed = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  # Guest accounts (no "wheel" or "docker" so they stay unprivileged and isolated)
  users.users.guest1 = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" ];
    initialPassword = "123";
  };

  users.users.guest2 = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" ];
    initialPassword = "123";
  };

  # Enables your shared home-manager.sharedModules (./home.nix) for every listed user
  home-manager.users = {
    raed = {};
    guest1 = {};
    guest2 = {};
  };
}