{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.waybar;
  cfg_hypr = config.my.home.hyprland;
in {
  options.my.home.waybar.enable = lib.mkEnableOption "Enable Waybar in Home Manager";

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.waybar = {
        enable = true;

        settings = [
          {
            layer = "top";
            position = "top";
            modules-left = ["hyprland/workspaces"];
            modules-center = ["clock"];
            modules-right = [
              "network"
              "cpu"
              "memory"
              "disk"
              "battery"
              "tray"
            ];

            "network" = {
              interval = 5;
              format-ethernet = " {ifname}";
              format-wifi = " {essid}";
              format-disabled = "";
              format-disconnected = " Disconnected";
              tooltip-format = "{ipaddr}/{cidr}";
            };

            "cpu" = {
              format = " {usage}%";
              interval = 5;
            };

            "memory" = {
              format = " {used} / {total} GB";
              interval = 5;
            };

            "disk" = {
              interval = 30;
              format = " {percentage_used} %";
            };

            "clock" = {
              format = " {:%H:%M}";
              format-alt = " {:%A %d %B %Y}";
              tooltip = false;
            };

            "battery" = {
              format = " {capacity}%";
            };

            "hyprland/workspaces" = {
              format = "{icon} {name}";
              format-icons = {
                visible = "";
                default = "";
              };
            };
          }
        ];

        style = builtins.readFile "${./waybar.css}";
      };

      home.packages = with pkgs; [font-awesome];
      services.network-manager-applet.enable = true;
    })
    (lib.mkIf (cfg.enable && cfg_hypr.enable) {
      wayland.windowManager.hyprland.settings.exec-once = ["waybar"];
    })
  ];
}
