{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core CLI & Dev
    vim
    git
    htop
    btop
    fastfetch
    tmux
    curl
    firejail
    jq
    oh-my-posh
    uv
    rustc
    cargo
    go
    gcc
    python314
    cmake
    gnumake
    ninja

    vscodium
    zed-editor
  ];
}
