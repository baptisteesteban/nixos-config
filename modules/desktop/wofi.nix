{
  flake.modules.homeManager.wofi = {lib, ...}: {
    programs.wofi = {
      enable = true;
    };

    wayland.windowManager.hyprland.settings.bind = [
      {
        _args = [
          (lib.generators.mkLuaInline ''mod .. " + D"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wofi --show drun")'')
        ];
      }
    ];
  };
}
