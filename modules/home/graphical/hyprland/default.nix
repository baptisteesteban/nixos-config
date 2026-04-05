{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.hyprland;
in {
  options.my.home.hyprland.enable = lib.mkEnableOption "Enable Hyprland in Home Manager";

  imports = [
    ./base.nix
    ./bind.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./nwg-displays.nix
    ./swayosd.nix
  ];
}
