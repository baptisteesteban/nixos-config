{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.btop;
in {
  options.my.home.btop.enable = lib.mkEnableOption "Enable btop in Home Manager";

  config = lib.mkIf cfg.enable {
    programs.btop.enable = true;
  };
}
