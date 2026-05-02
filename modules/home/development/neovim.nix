{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.nvim;
in {
  options.my.home.nvim.enable = lib.mkEnableOption "Enable nvim in home manager";

  config = lib.mkIf cfg.enable {
    programs.neovim.enable = true;
  };
}
