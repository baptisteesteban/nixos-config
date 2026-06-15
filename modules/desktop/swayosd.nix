{
  flake.modules.homeManager.swayosd = {lib, ...}: {
    services.swayosd = {
      enable = true;
    };

    wayland.windowManager.hyprland.settings.bind = [
      {
        _args = [
          (lib.generators.mkLuaInline ''"XF86AudioRaiseVolume"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("swayosd-client --output-volume raise")'')
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline ''"XF86AudioLowerVolume"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("swayosd-client --output-volume lower")'')
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline ''"XF86MonBrightnessUp"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("swayosd-client --brightness +10")'')
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline ''"XF86MonBrightnessDown"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("swayosd-client --brightness -10")'')
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline ''"XF86AudioMute"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle")'')
        ];
      }
    ];
  };
}
