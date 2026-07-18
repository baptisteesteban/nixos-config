{
  flake.modules.homeManager.vscode = {pkgs, ...}: {
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
              rust-lang.rust-analyzer
              marp-team.marp-vscode
              tamasfe.even-better-toml
              ms-vscode-remote.remote-ssh-edit
              ms-vscode-remote.remote-ssh
              ms-vscode.cpptools
              tomoki1207.pdf
              stkb.rewrap
              ms-python.python
            ]
            ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [imanolea.z80-asm];
        userSettings = {
          "editor.inlineSuggest.enabled" = false;

          "editor.fontFamily" = "'JetBrains Mono', 'AdwaitaMono Nerd Font', 'monospace'";
          "editor.fontLigatures" = true;
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nil";
          "C_Cpp.intelliSenseEngine" = "disabled";
        };
      };
    };
  };
}
