{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.z80;
in {
  options.my.home.z80.enable = lib.mkEnableOption "Enable z80 development in home manager";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [sjasmplus fuse-emulator];
  };
}
