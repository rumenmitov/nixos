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
      initrd.kernelModules = [ "amdgpu" ];
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
    configPackages = [ pkgs.xdg-desktop-portal-gtk ];
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.picom = {
      enable = true;
      settings = {
          blur = {
              method = "gaussian";
              size = 10;
              deviation = 5.0;
          };
      };
  };

  services.displayManager.sddm = {
          enable = true;
          theme = "${import ./sddm-theme.nix {inherit pkgs;} }";
  };

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    videoDrivers = [ "amdgpu" ];
    windowManager.xmonad = {
       enable = true;
       enableContribAndExtras = true;
    };
  };

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

  services.libinput.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  services.openssh.enable = true;

  system.copySystemConfiguration = false;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  system.stateVersion = "24.05"; 

}

