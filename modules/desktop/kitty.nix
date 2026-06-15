{
  flake.modules.homeManager.kitty = {
    pkgs,
    lib,
    ...
  }: {
    home.packages = with pkgs; [jetbrains-mono];

    programs.kitty = {
      enable = true;

      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        cursor_shape = "beam";
      };

      font = {
        name = "JetBrains Mono";
        size = 10;
      };
    };

    wayland.windowManager.hyprland.settings.bind = [
      {
        _args = [
          (lib.generators.mkLuaInline ''mod .. " + RETURN"'')
          (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty")'')
        ];
      }
    ];
  };
}
