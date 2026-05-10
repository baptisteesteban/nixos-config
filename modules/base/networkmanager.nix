{
  flake.modules.nixos.base = {
    networking.networkmanager.enable = true;
    networking.networkmanager.wifi.backend = "wpa_supplicant";
    networking.networkmanager.wifi.scanRandMacAddress = false;
  };
}
