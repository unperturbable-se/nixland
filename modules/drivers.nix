{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Audio (Required for Waybar audio controls)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Audio & Wayland Qt Support
    wireplumber
    brightnessctl 
    pulseaudio
    pavucontrol
  ];
}
