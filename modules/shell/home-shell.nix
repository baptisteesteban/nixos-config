{config, ...}: {
  flake.modules.homeManager.shell = {
    imports = [
      config.flake.modules.homeManager.fish
      config.flake.modules.homeManager.starship
    ];
  };
}
