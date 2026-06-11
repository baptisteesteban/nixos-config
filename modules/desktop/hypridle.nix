# TODO: Fix this into a better config !!!!!
{
  flake.modules.homeManager.hypridle = {lib, ...}: {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
          #ignore_dbus_inhibit = false;
        };
      };
    };
    wayland.windowManager.hyprland.settings.on = {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function ()
            hl.exec_cmd("hypridle")
          end
        '')
      ];
    };
  };
}
