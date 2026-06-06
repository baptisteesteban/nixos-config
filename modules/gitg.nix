{
  flake.modules.homeManager.gitg = {pkgs, ...}: {
    home.packages = [pkgs.gitg];
  };
}
