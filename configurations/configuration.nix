{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./systemd-timers.nix
      ./packages.nix
      ./users.nix
    ];

  boot = {
      loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
          grub.device = "nodev";
      };
      tmp.cleanOnBoot = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
      hostName = "black-eagle";
      networkmanager.enable = true;  
      firewall = {
          allowedTCPPorts = [  ];
          allowedUDPPorts = [  ];
          enable = true;
      };
  };

  time.timeZone = "Europe/Luxembourg";

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "${import ./sddm-theme.nix {inherit pkgs;} }";
      wayland.enable = true;
    };
    excludePackages = [ pkgs.xterm ];
  };

  programs.hyprland.enable = true;

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.pipewire = {
      enable = true;
      wireplumber.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.opentabletdriver.enable = true;

  services.udev.extraRules = "";

  services.blueman.enable = true;

  services.xserver.libinput.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  system.copySystemConfiguration = false;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  system.stateVersion = "23.11"; 

}

