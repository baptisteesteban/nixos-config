{
  config,
  lib,
  ...
}: let
  cfg = config.my.networkmanager;
in {
  options.my.networkmanager.enable = lib.mkEnableOption "Enable NetworkManager";

  config = lib.mkIf cfg.enable {
    networking.networkmanager.enable = true;
    networking.networkmanager.wifi.backend = "wpa_supplicant";
    networking.networkmanager.wifi.scanRandMacAddress = false;
  };
}
