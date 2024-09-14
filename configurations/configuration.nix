{ pkgs, ... }:

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

  powerManagement.enable = true;

  networking = {
      hostName = "black-eagle";
      networkmanager.enable = true;  
      firewall = {
          allowedTCPPorts = [ 22 ];
          allowedUDPPorts = [ 22 ];
          enable = true;
      };
  };

  time.timeZone = "Europe/Luxembourg";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.xdg-desktop-portal-gtk ];
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.displayManager.sddm = {
          enable = true;
          theme = "${import ./sddm-theme.nix {inherit pkgs;} }";
  };

  services.picom.enable = true;

  services.gnome.gnome-keyring.enable = true;

  security.polkit.enable = true;

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
        config = '' config /home/rumen/Other/Nextcloud/PhantomOS/constr.ovpn ''; 
        updateResolvConf = true;
        extraArgs = [""];
    };
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.opentabletdriver.enable = true;

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = [ pkgs.mesa.drivers ];
  hardware.amdgpu.amdvlk.enable = true;

  services.udev.extraRules = "";

  services.blueman.enable = true;

  services.libinput.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
          dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
          localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  services.openssh.enable = true;

  system.copySystemConfiguration = false;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  system.stateVersion = "24.05"; 

}

