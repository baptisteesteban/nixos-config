{
  flake.modules.homeManager.screenshot = {
    pkgs,
    lib,
    ...
  }: {
    home.packages = with pkgs; [grim slurp wl-clipboard];

    wayland.windowManager.hyprland.settings.bind = [
      {
        _args = [
          (lib.generators.mkLuaInline ''"Print"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("grim")'')
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline ''mod .. " + Print"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd('grim -g "$(slurp)"')'')
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline ''mod .. " + SHIFT + Print"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy')'')
        ];
      }
    ];
  };
}
