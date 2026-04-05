{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.mako;
in {
  options.my.home.mako.enable = lib.mkEnableOption "Enable Mako in Home Manager";

  config = lib.mkIf cfg.enable {
    services.mako.enable = true;
  };
}
