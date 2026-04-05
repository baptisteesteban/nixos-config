{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.python;
in {
  options.my.home.python.enable = lib.mkEnableOption "Enable Python development in Home Manager";

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.numpy
        python-pkgs.matplotlib
        python-pkgs.ipython
        python-pkgs.notebook
      ]))
    ];
  };
}
