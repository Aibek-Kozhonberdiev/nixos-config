# /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # AMD driver
  # hardware = {
  #   graphics = {
  #       enable = true;
  #       enable32Bit = true;
  #   };

  #   amdgpu.amdvlk = {
  #       enable = true;
  #       support32Bit.enable = true;
  #   };
  # };

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Asia/Bishkek";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ky_KG";
    LC_IDENTIFICATION = "ky_KG";
    LC_MEASUREMENT = "ky_KG";
    LC_MONETARY = "ky_KG";
    LC_NAME = "ky_KG";
    LC_NUMERIC = "ky_KG";
    LC_PAPER = "ky_KG";
    LC_TELEPHONE = "ky_KG";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:caps_toggle";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aiba = {
    isNormalUser = true;
    description = "aiba";
    home = "/home/aiba";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the Docker daemon.
  virtualisation.docker.enable = true;

  # Enable the Flatpak.
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Version NixOS
  system.stateVersion = "25.11";
}
