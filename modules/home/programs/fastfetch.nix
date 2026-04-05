{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.fastfetch;
in {
  options.my.home.fastfetch.enable = lib.mkEnableOption "Enable fastfetch in Home Manager";

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
    };
  };
}
