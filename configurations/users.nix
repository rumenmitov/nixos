{ config, pkgs, ... }:
{
  users.users.rumen = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      librewolf
      firefox
      ungoogled-chromium
      pass-wayland
      gnome.nautilus
      webcord
      nwg-look
      kdePackages.kdeconnect-kde
      nextcloud-client
      logseq
      joplin-desktop
      libreoffice-fresh
      kdePackages.okular
      vlc
      qview
      rnote

      # Neovim
      neovim

      # Terminal
      fish
      lsd
      ripgrep
      bat
      tty-clock
      podman
      docker-compose
      tldr
      tmux

      # Hyprland
      hyprcursor
      hyprlock
      rofi-power-menu
      wl-clipboard
      rofimoji
      rofi
      slurp
      grim
      swww
      cliphist
    ];
  };
}

