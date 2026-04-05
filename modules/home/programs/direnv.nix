{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.direnv;
in {
  options.my.home.direnv.enable = lib.mkEnableOption "Enable direnv in home-manager";

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
