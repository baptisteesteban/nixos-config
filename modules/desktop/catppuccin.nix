{inputs, ...}: {
  flake.modules.homeManager.catppuccin = {pkgs, ...}: {
    imports = [
      inputs.catppuccin-nix.homeModules.catppuccin
    ];

    catppuccin = {
      enable = true;
      flavor = "mocha";
      cache.enable = true;

      sources.vscode = inputs.catppuccin-nix.packages.${pkgs.stdenv.hostPlatform.system}.vscode.override {
        pnpm_10 = pkgs.pnpm_10_latest;
      };

      hyprlock.enable = false;
    };
  };
}
