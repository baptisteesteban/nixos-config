{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.eza;
  cfg_bash = config.my.home.bash;
  cfg_fish = config.my.home.fish;
in {
  options.my.home.eza.enable = lib.mkEnableOption "Enable eza replacement of ls";

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.eza.enable = true;
    })
    (lib.mkIf (cfg_bash.enable && cfg_bash.enable) {
      programs.eza.enableBashIntegration = true;
    })
    (lib.mkIf (cfg.enable && cfg_fish.enable) {
      programs.eza.enableFishIntegration = true;
    })
  ];
}
