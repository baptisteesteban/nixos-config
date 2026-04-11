{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # System level modules
  my.nix.enable = true;
  my.networkmanager.enable = true;
  my.sddm.enable = true;
  my.users.enable = true;
  my.hyprland.enable = true;
  my.virtualisation.enable = true;
  my.nvidia.enable = true;

  # NVIDIA Specific
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2.0";
    nvidiaBusId = "PCI:1:0.0";
  };

  # Systemwide environment variables
  environment.variables = {
    AQ_DRM_DEVICES = "/dev/dri/card1"; # Only run graphic interface in integrated GPU
  };

  # Hostname definition
  networking.hostName = "decarabia";

  # Local
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "fr";

  # System version
  system.stateVersion = "25.11";
}
