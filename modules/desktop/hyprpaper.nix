{
  flake.modules.homeManager.hyprpaper = {
    services.hyprpaper = {
      enable = true;

      settings = let
        wallpaper = ../../assets/bassin_villette.jpg;
      in {
        preload = ["${wallpaper}"];
        wallpaper = [",${wallpaper}"];
      };
    };

    wayland.windowManager.hyprland.settings.exec-once = ["hyprpaper"];
  };
}
