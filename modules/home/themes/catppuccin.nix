{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.catppuccin;
in {
  options.my.home.catppuccin.enable = lib.mkEnableOption "Enable Catppuccin theme in Home Manager";

  config = lib.mkIf cfg.enable {
    catppuccin = {
      enable = true;
      flavor = "mocha";

      hyprlock.enable = false;
    };
  };
}
