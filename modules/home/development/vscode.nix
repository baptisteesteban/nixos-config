{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.home.vscode;
in {
  options.my.home.vscode.enable = lib.mkEnableOption "Enable VSCode in Home Manager";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [nerd-fonts.adwaita-mono];

    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;
      profiles.default = {
        enableUpdateCheck = false;
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          github.copilot-chat
        ];
        userSettings = {
          "editor.inlineSuggest.enabled" = false;
          "github.copilot.inlineSuggest.enable" = false;

          "editor.fontFamily" = "'JetBrains Mono', 'AdwaitaMono Nerd Font', 'monospace'";
          "editor.fontLigatures" = true;
        };
      };
    };
  };
}
