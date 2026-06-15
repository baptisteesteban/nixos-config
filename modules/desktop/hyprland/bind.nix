{
  flake.modules.homeManager.hyprland = {lib, ...}: {
    wayland.windowManager.hyprland.settings = {
      bind = [
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + Q"'')
            (lib.generators.mkLuaInline "hl.dsp.window.close()")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + F"'')
            (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + V"'')
            (lib.generators.mkLuaInline "hl.dsp.window.float()")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + P"'')
            (lib.generators.mkLuaInline "hl.dsp.window.pin()")
          ];
        }

        # Change Window Focus
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + left"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({direction = "l"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + right"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({direction = "r"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + up"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({direction = "u"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + down"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({direction = "d"})'')
          ];
        }

        # Move window
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + up"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({direction = "u"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + down"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({direction = "d"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + left"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({direction = "l"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + right"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({direction = "r"})'')
          ];
        }

        # Workspaces
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:10"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "1"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:11"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "2"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:12"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "3"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:13"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "4"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:14"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "5"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:15"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "6"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:16"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "7"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:17"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "8"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:18"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "9"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + code:19"'')
            (lib.generators.mkLuaInline ''hl.dsp.focus({workspace = "10"})'')
          ];
        }

        # Move to workspace
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:10"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "1"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:11"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "2"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:12"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "3"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:13"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "4"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:14"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "5"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:15"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "6"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:16"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "7"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:17"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "8"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:18"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "9"})'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + code:19"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.move({workspace = "10"})'')
          ];
        }

        # Mouse
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + mouse:272"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.drag()'')
            (lib.generators.mkLuaInline ''{ mouse = true }'')
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + mouse:273"'')
            (lib.generators.mkLuaInline ''hl.dsp.window.resize()'')
            (lib.generators.mkLuaInline ''{ mouse = true }'')
          ];
        }
      ];
    };
  };
}
