{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.bat;
in {
  options.my.home.bat.enable = lib.mkEnableOption "Enable bat replacement of cat";

  config = lib.mkIf cfg.enable {
    programs.bat.enable = true;
    home.shellAliases = {
      cat = "bat";
    };
  };
}
