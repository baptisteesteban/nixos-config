{
  flake.modules.homeManager.eza = {
    programs.eza.enable = true;
    home.shellAliases = {
      ls = "eza";
    };
  };
}
