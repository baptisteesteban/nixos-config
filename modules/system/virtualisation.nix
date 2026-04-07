{ config, lib, ... }:
let
  cfg = config.my.virtualisation;
in
{
  options.my.virtualisation.enable = lib.mkEnableOption "Enable virtualization module";

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
