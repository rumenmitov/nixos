{ pkgs, ... }:
{
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    btop
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
    gimp
    git
    glib
    glibc
    gnumake
    go
    gopls
    hackgen-nf-font
    haskell-language-server
    imagemagick
    libnotify
    libsForQt5.qt5.qtgraphicaleffects
    lsof
    lua-language-server
    man-db
    man-pages
    man-pages-posix
    meson
    pamixer
    pinentry-qt
    polkit
    rustup
    sddm
    unzip
    vim 
    virtiofsd
    wget
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
    xclip
    shutter
    xmobar
    xwallpaper
    haskellPackages.greenclip
    rofi
    rofi-pass
    i3lock
  ];
}
