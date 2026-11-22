{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Apps
    google-chrome
    keepassxc
    firefox
    kitty
    kdePackages.kate
    vlc
    imv
    libreoffice
    joplin-desktop
    obsidian
    wireshark
    whatsapp-electron
    yazi
    dragon-drop #for dragndrop in yazi
    kdePackages.dolphin
    kdePackages.kio-extras
    kdePackages.kdegraphics-thumbnailers
    kdePackages.breeze-icons
    kdePackages.kdenlive
    nemo
  ];
}
