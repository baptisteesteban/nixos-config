{
  flake.modules.homeManager.mines = {pkgs, ...}: {
    home.packages = with pkgs; [gnome-mines]; # My favorite game
  };
}
