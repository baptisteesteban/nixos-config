{
  flake.modules.homeManager.wofi = {
    programs.wofi = {
      enable = true;
    };

    wayland.windowManager.hyprland.settings.bind = ["$mod, d, exec, wofi --show drun"];
  };
}
