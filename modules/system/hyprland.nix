{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.hyprland;
in {
  options.my.hyprland.enable = lib.mkEnableOption "Enable hyprland compositor";

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.libinput.enable = true;

    # Here, we follow the advices here: https://wiki.hypr.land/Useful-Utilities/Must-have/
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [
      kitty # Terminal
      mako # Notification deamon
      pkgs.noto-fonts # Default fonts
    ];
  };
}
