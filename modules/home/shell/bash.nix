{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.bash;
in {
  options.my.home.bash.enable = lib.mkEnableOption "Enable Bash in Home Manager";

  config = lib.mkIf cfg.enable {
    programs.bash.enable = true;
  };
}
