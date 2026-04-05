{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.hyprland;
in {
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, d, exec, wofi --show drun"
        "$mod_shift, b, exec, brave"
        "$mod_shift, q, killactive"
        "$mod, l, exec, hyprlock"
        "$mod, F, fullscreen"
        "$mod, V, togglefloating"
        "$mod, P, pin"

        # Change Window Focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Move Window
        "$mod_shift, left, movewindoworgroup, l"
        "$mod_shift, right, movewindoworgroup, r"
        "$mod_shift, up, movewindoworgroup, u"
        "$mod_shift, down, movewindoworgroup, d"

        # Workspaces
        "$mod, code:10, workspace, 1"
        "$mod, code:11, workspace, 2"
        "$mod, code:12, workspace, 3"
        "$mod, code:13, workspace, 4"
        "$mod, code:14, workspace, 5"
        "$mod, code:15, workspace, 6"
        "$mod, code:16, workspace, 7"
        "$mod, code:17, workspace, 8"
        "$mod, code:18, workspace, 9"
        "$mod, code:19, workspace, 10"

        # Send to Workspaces
        "$mod_shift, code:10, movetoworkspace, 1"
        "$mod_shift, code:11, movetoworkspace, 2"
        "$mod_shift, code:12, movetoworkspace, 3"
        "$mod_shift, code:13, movetoworkspace, 4"
        "$mod_shift, code:14, movetoworkspace, 5"
        "$mod_shift, code:15, movetoworkspace, 6"
        "$mod_shift, code:16, movetoworkspace, 7"
        "$mod_shift, code:17, movetoworkspace, 8"
        "$mod_shift, code:18, movetoworkspace, 9"
        "$mod_shift, code:19, movetoworkspace, 10"
      ];

      binde = [
        # Audio +/- buttons
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"

        # Resize window
        "$mod ALT, right, resizeactive, 10 0"
        "$mod ALT, left, resizeactive, -10 0"
        "$mod ALT, up, resizeactive, 0 10"
        "$mod ALT, down, resizeactive, 0 -10"
      ];

      bindl = [
        # Audio mute button
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
