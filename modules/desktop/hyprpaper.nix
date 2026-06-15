{
  flake.modules.homeManager.hyprpaper = {
    services.hyprpaper = {
      enable = true;

      settings = let
        wallpaper_path = ../../assets/bassin_villette.jpg;
      in {
        wallpaper = {
          monitor = "";
          path = "${wallpaper_path}";
          fit_mode = "cover";
        };
        splash = false;
      };
    };
  };
}
