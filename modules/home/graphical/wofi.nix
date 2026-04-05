{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.wofi;
in {
  options.my.home.wofi.enable = lib.mkEnableOption "Enable wofi in Home Manager";

  config = lib.mkIf cfg.enable {
    programs.wofi = {
      enable = true;
    };
  };
}
