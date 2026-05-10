{config, ...}: {
  flake.modules.homeManager.baptou-base = {
    home.username = "baptou";
    home.homeDirectory = "/home/baptou";

    imports = [
      config.flake.modules.homeManager.bat
      config.flake.modules.homeManager.eza
      config.flake.modules.homeManager.ripgrep
    ];
  };
}
