{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.kitty;
in {
  options.my.home.kitty.enable = lib.mkEnableOption "Enable Kitty in Home Manager";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [jetbrains-mono];

    programs.kitty = {
      enable = true;

      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        cursor_shape = "beam";
      };

      font = {
        name = "JetBrains Mono";
        size = 10;
      };
    };
  };
}
