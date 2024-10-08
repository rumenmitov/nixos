{ pkgs, ... }:
{
  programs.fish.enable = true;
  programs.zsh = {
      enable = true;
      autosuggestions = {
          enable = true;
          strategy = [ "history" "completion" ];
      };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # System
    brightnessctl
    btop
    curl
    dunst
    ffmpeg
    file
    glib
    glibc
    dbus
    hackgen-nf-font
    imagemagick
    libnotify
    libsForQt5.qt5.qtgraphicaleffects
    lsof
    man-db
    man-pages
    man-pages-posix
    pamixer
    pavucontrol
    pinentry-gnome3
    polkit
    sddm
    unzip
    virtiofsd
    wget
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
    st
    vim 
    dmenu
    shutter
    xclip
    xorg.xhost
    xorg.xkill
    xmobar
    nitrogen
    haskellPackages.greenclip
    i3lock
    xorg.xrandr


    # Programming
    cabal-install
    cargo
    clang-tools
    cmake
    gcc
    gdb
    ghc
    git
    gnumake
    go
    gopls
    haskell-language-server
    lua-language-server
    meson
    nil
    nodejs
    rustc
    rustup
    python3
    nixfmt-classic
    php
    phpactor
  ];
}
