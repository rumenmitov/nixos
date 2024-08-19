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
    i3lock
    haskellPackages.greenclip
    imagemagick
    libnotify
    libsForQt5.qt5.qtgraphicaleffects
    lsof
    man-db
    man-pages
    man-pages-posix
    nitrogen
    pamixer
    pavucontrol
    pinentry-qt
    polkit
    dmenu
    sddm
    shutter
    unzip
    virtiofsd
    wget
    xclip
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
    xorg.xhost
    xorg.xkill
    xmobar
    alacritty
    vim 


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

  ];
}
