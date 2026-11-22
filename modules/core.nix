{ config, pkgs, ... }:

{
   imports = [ ../hardware-configuration.nix ];
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;
  
   networking.networkmanager = {
      enable = true;
  };

  networking.wireless.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.firejail.enable=true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;
  programs.nm-applet = {
  enable = true;
  indicator = true;
  };
  services.openssh.enable = true;

  # Home Manager system-wide settings
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.sharedModules = [ ./home.nix ];
    
    system.stateVersion = "25.11";
}
