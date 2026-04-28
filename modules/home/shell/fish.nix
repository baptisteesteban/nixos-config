{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.fish;
in {
  options.my.home.fish.enable = lib.mkEnableOption "Enable Fish shell";

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
    };
  };
}
