{
  description = "my op nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/ac588ef1c914"; # Your pinned commit

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05"; # Match your nixpkgs version
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Adjust if you are on a different architecture
        modules = [
          home-manager.nixosModules.home-manager
          ./modules/users.nix
          ./modules/core.nix
          ./modules/drivers.nix
          ./modules/hyprland.nix
          ./modules/dev.nix
          ./modules/apps.nix
          ./modules/locales.nix
          #./machines/nvidia.nix
          #./machines/virtual_machine.nix
        ];
      };
    };
  };
}