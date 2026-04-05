{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.hyprland;
in {
  config = lib.mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;

      settings = let
        wallpaper = ../../../../assets/bassin_villette.jpg;
      in {
        preload = ["${wallpaper}"];
        wallpaper = [",${wallpaper}"];
      };
    };
  };
}
