{inputs, ...}: {
  flake.modules.homeManager.catppuccin = {
    imports = [
      inputs.catppuccin-nix.homeModules.catppuccin
    ];

    catppuccin = {
      enable = true;
      flavor = "mocha";
      cache.enable = true;

      hyprlock.enable = false;
    };
  };
}
