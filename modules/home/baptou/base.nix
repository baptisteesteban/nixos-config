{config, ...}: {
  flake.modules.homeManager.baptou-base = {pkgs, ...}: {
    home.username = "baptou";
    home.homeDirectory = "/home/baptou";

    home.packages = with pkgs; [
      zip # Zip compression
      unzip # Zip decompression
    ];

    imports = [
      config.flake.modules.homeManager.bat
      config.flake.modules.homeManager.eza
      config.flake.modules.homeManager.ripgrep
    ];
  };
}
