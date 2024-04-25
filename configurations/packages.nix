{ pkgs, ... }:
{
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    virtiofsd
    alacritty
    brightnessctl
    cabal-install
    clang-tools
    cmake
    curl
    dbus
    dunst
    ffmpeg
    file
    gcc
    gdb
    ghc
    git
    glib
    glibc
    gnumake
    go
    gopls
    hackgen-nf-font
    haskell-language-server
    htop
    imagemagick
    libnotify
    libsForQt5.qt5.qtgraphicaleffects
    lsof
    lua-language-server
    man-db
    man-pages
    man-pages-posix
    meson
    nodejs_21
    pamixer
    polkit
    rust-analyzer
    cargo
    rustup
    sddm
    unzip
    vim 
    wayland-protocols
    wayland-utils
    wget
    wl-clipboard
    wlroots
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
    xwayland
  ];
}
