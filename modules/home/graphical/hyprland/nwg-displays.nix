{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.hyprland;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [nwg-displays];
  };
}
