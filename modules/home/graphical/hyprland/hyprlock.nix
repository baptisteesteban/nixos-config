{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.hyprland;
in {
  config = lib.mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;

      settings = {
        general = {
          hide_cursor = true;
        };

        background = [
          {
            path = "${../../../../assets/canal_saint_martin.png}";
            blur_passes = 2;
            blur_size = 2;
          }
        ];

        label = [
          {
            text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';
            font_size = 115;
            halign = "center";
            valign = "center";
            position = "0, 250";
            color = "rgba(0, 0, 0, 0.85)";
            font_family = "JetBrains Mono";
          }

          {
            text = ''cmd[update:1000] echo "$(date +'%A %d %B %Y')"'';
            font_size = 50;
            halign = "center";
            valign = "center";
            position = "0, 0";
            color = "rgba(0, 0, 0, 0.85)";
            font_family = "JetBrains Mono";
          }
        ];

        input-field = [
          {
            monitor = "";
            position = "0%, -35%";
            halign = "center";
            valign = "center";
            size = "20%, 5%";
            font_color = "rgba(207, 213, 219, 1.0)";
            inner_color = "rgba(32, 39, 25, 0.4)";
            outer_color = "rgba(0, 0, 0, 0.85)";
            rounding = 1;
            outline_thickness = 1;
            hide_input = false;
            placeholder_text = "Enter password";
            fade_on_empty = false;
            font_family = "JetBrains Mono";
          }
        ];
      };
    };
  };
}
