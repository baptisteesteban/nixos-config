{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.mines;
in {
  options.my.home.mines.enable = lib.mkEnableOption "Enable GNOME Mines in Home Manager";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [gnome-mines];
  };
}
