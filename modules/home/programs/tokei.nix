{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.tokei;
in {
  options.my.home.tokei.enable = lib.mkEnableOption "Enable tokei code statistics";

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.tokei];
  };
}
