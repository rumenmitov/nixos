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
    dmenu
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
    haskellPackages.greenclip
    i3lock
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
    rofi
    rofi-pass
    rustup
    sddm
    shutter
    unzip
    vim 
    virtiofsd
    wget
    xclip
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
    xmobar
    xsel
    xwallpaper
  ];
}
