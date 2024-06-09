{ pkgs, ... }:
{
  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    btop
    cabal-install
    cargo
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
    nil
    nodejs
    pamixer
    pavucontrol
    pinentry-qt
    polkit
    rofi
    rofi-pass
    rustc
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
    xorg.xhost
    xmobar
    xwallpaper
  ];
}
