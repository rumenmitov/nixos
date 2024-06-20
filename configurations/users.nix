{ config, pkgs, ... }:
{
  users.users.rumen = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "libvirtd" ]; 
    packages = with pkgs; [
      SDL2
      librewolf
      firefox
      ungoogled-chromium
      pass
      gnome.nautilus
      kdePackages.kdeconnect-kde
      nextcloud-client
      logseq
      joplin-desktop
      libreoffice-fresh
      element-desktop
      papers
      nuclear
      vlc
      qview
      rnote

      # Neovim
      neovim
      texliveFull

      # Emacs
      emacs-gtk
      ghostscript
      ispell

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
      stow
      acpi
    ];
  };
}

