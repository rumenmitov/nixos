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

  # Hyprland
  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
  };
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
          wayland.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  security.polkit.enable = true;

  security.pam.services.sddm.enableGnomeKeyring = true;

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

