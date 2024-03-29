{ pkgs, ... }:
{
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
    curl
    lsof
    gcc
    clang-tools
    cmake
    rustup
    go
    nodejs_21
    ffmpeg
    imagemagick
    git
    ghc
    unzip
    file
    alacritty
    hackgen-nf-font
    glib
    glibc
    gnumake
    man-db
    man-pages
    man-pages-posix

    sddm
    libsForQt5.qt5.qtgraphicaleffects
    pamixer
    brightnessctl
    xdg-utils
    dunst
    libnotify
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
