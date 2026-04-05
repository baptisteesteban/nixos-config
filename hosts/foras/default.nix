{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];
  # Boot options
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # System level modules
  my.nix.enable = true;
  my.networkmanager.enable = true;
  my.sddm.enable = true;
  my.users.enable = true;
  my.hyprland.enable = true;

  # Hostname definition
  networking.hostName = "foras";

  # Local
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "fr";

  # Systemwide environment variables
  environment.variables = {
    AQ_DRM_DEVICES = "/dev/dri/card1"; # Only run graphic interface in integrated GPU
  };

  # System version
  system.stateVersion = "25.11";
}
