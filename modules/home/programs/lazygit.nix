{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.lazygit;
in {
  options.my.home.lazygit.enable = lib.mkEnableOption "Enable lazygit in Home Manager";

  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
    };
  };
}
