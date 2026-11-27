{ config, pkgs, ... }:

{
  # Display Manager (ReGreet + Greetd) & Hyprland
  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        application_prefer_dark_theme = true;
      };
    };
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable=true;

  # Required for screen sharing, GTK theming, and Electron apps
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  environment.systemPackages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland

    # Hyprland & Dotfile Ecosystem
    waybar
    rofi
    swaynotificationcenter
    hyprpaper
    wlogout
    matugen
    wl-clipboard
    grim
    slurp
    networkmanagerapplet
    awww
    quickshell
    libnotify
    hyprpolkitagent
    papirus-icon-theme
    hyprlock
    hyprlandPlugins.hyprbars
    libdbusmenu-gtk3
    libappindicator-gtk3
    #iwgtk
    socat
    bubblewrap
    glycin-loaders
  ];
}
