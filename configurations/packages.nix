{ pkgs, ... }:
{
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
    curl
    lsof
    gcc
    clang
    cmake
    rustup
    go
    nodejs_21
    git
    ghc
    unzip
    alacritty
    hackgen-nf-font
    glib
    glibc
    gnumake

    sddm
    libsForQt5.qt5.qtgraphicaleffects
    pamixer
    brightnessctl
    xdg-utils
    dbus
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xwayland
    polkit
    meson
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
  ];
}
