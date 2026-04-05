{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.hyprland;
in {
  config = lib.mkIf cfg.enable {
    services.swayosd = {
      enable = true;
    };
  };
}
