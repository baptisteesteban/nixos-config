{
  flake.modules.homeManager.swayosd = {
    services.swayosd = {
      enable = true;
    };

    #wayland.windowManager.hyprland.settings = {
    #  binde = [
    #    # Audio +/- buttons
    #    ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
    #    ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
    #
    #    # Brightness
    #    ", XF86MonBrightnessUp, exec, swayosd-client --brightness +10"
    #    ", XF86MonBrightnessDown, exec, swayosd-client --brightness -10"
    #  ];
    #
    #  bindl = [
    #    # Audio mute button
    #    ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
    #  ];
    #};
  };
}
