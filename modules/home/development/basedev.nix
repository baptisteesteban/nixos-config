{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.basedev;
in {
  options.my.home.basedev.enable = lib.mkEnableOption "Enable base development (C/C++)";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gcc
      gdb
      gnumake
      valgrind
      ltrace
      strace
    ];
  };
}
