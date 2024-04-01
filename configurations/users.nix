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
      element-desktop
      kdePackages.okular
      vlc
      qview
      rnote

      # Neovim
      neovim
      texliveFull

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
      wl-clipboard
      rofi-wayland
      slurp
      grim
      swww
      cliphist
    ];
  };
}

