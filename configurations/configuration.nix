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

  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
  };

  nixpkgs.config.permittedInsecurePackages = [
                "electron-27.3.11"
              ];

  powerManagement.enable = true;

  networking = {
      hostName = "black-eagle";
      networkmanager.enable = true;  
      firewall = {
          allowedTCPPorts = [ 22 51820 ];
          allowedUDPPorts = [ 22 51820 ];
          enable = true;
          checkReversePath = false; 
      };

       wireguard.interfaces = {
           wg0 = {
               ips = [ "10.5.5.0/32" ];
               listenPort = 51820;
               mtu = 1320;
               privateKeyFile = "/etc/nixos/secrets/wireguard/private";
               peers = [
               {
                   publicKey = "EKRg8L2/7irwTnGYYJR4zEazRM0/N37pS7XXFWXaAjs=";
                   allowedIPs = [ "0.0.0.0/0" ];
                   endpoint = "rumenmitov.duckdns.org:51820"; 
                   persistentKeepalive = 25;
               }
               ];
           };
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
  };

  services.displayManager.sddm = {
          enable = true;
          theme = "${import ./sddm-theme.nix {inherit pkgs;} }";
  };

  services.gnome.gnome-keyring.enable = true;

  security.pam.services.sddm.enableGnomeKeyring = true;

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    videoDrivers = [ "amdgpu" ];
    windowManager.xmonad = {
       enable = true;
       enableContribAndExtras = true;
    };
  };

  services.openvpn.servers = {
    officeVPN  = { 
        config = '' config /home/rumen/Downloads/constr.ovpn ''; 
        updateResolvConf = true;
    };
  };

  services.printing.enable = true;

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

