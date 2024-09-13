{ config, pkgs, ... }:
{
  users.users.rumen = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "libvirtd" "networkmanager" ]; 
    packages = with pkgs; [
      # Applications
      librewolf
      firefox
      ungoogled-chromium
      pass
      rofi-pass-wayland
      nautilus
      kdePackages.kdeconnect-kde
      nextcloud-client
      joplin-desktop
      libreoffice-fresh
      papers
      nuclear
      vlc
      qview
      rnote
      gimp
      wireguard-tools
      gpt4all
      pandoc

      # Neovim
      neovim
      texliveFull

      # Emacs
      emacs-gtk
      ghostscript
      ispell

      # Terminal
      lsd
      tree
      ripgrep
      bat
      tty-clock
      podman
      docker
      docker-compose
      tldr
      tmux
      stow
      acpi
      rm-improved
      zoxide
    ];
  };
}

