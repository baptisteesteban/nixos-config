{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.ripgrep;
in {
  options.my.home.ripgrep.enable = lib.mkEnableOption "Enable ripgrep (rg) replacement of grep";

  config = lib.mkIf cfg.enable {
    programs.ripgrep.enable = true;
  };
}
