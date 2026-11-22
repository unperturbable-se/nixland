{ config, pkgs, ... }:

{
  # Enable QEMU guest integration and SPICE display/clipboard sharing
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  # Software cursor & WLR fallback so Hyprland renders smoothly without GPU passthrough
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };
}
