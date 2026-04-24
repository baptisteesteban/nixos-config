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
        extensions = let
          imanolea.z80-asm = {
            name = "z80-asm";
            publisher = "imanolea";
            version = "0.0.9";
            sha256 = "sha256-uiSEZg9aSMRwdBWAyNtfk9z+3TPflWAv7SKy6qdhvWw=";
          };
        in
          with pkgs.vscode-extensions;
            [
              jnoortheen.nix-ide
              github.copilot-chat
              llvm-vs-code-extensions.vscode-clangd
              ms-vscode.cmake-tools
              myriad-dreamin.tinymist
            ]
            ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [imanolea.z80-asm];
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
