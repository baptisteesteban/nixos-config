{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.hyprland;
in {
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        "$mod_shift" = "SUPER_SHIFT";

        # Monitors using nwg-displays
        source = ["${config.xdg.configHome}/hypr/monitors.conf"];

        dwindle = {
          force_split = 2;
        };

        input = {
          kb_layout = "fr";
          touchpad = {
            clickfinger_behavior = 1;
            natural_scroll = true;
          };
        };
        exec-once = ["hypridle" "hyprpaper"];
      };
    };

    # Handle no monitor configuration if not yet handled by nwg-display
    home.activation.create-hypr-monitors = ''
      mkdir -p "${config.xdg.configHome}/hypr"
      if [ ! -e "${config.xdg.configHome}/hypr/monitors.conf" ]; then
        touch "${config.xdg.configHome}/hypr/monitors.conf"
      fi
    '';

    # Handle cursor in Hyprland configuration
    home.pointerCursor = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
