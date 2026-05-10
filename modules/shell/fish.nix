{
  flake.modules.homeManager.fish = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
    };
    programs.starship.enableFishIntegration = true;
    programs.eza.enableFishIntegration = true;
  };
}
