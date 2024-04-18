{ config, pkgs, ... }:
{
  users.users.rumen = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "libvirtd" ]; 
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

      # Emacs
      emacs

      # Terminal
      fish
      lsd
      tree
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

