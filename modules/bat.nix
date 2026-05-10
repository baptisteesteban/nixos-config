{
  flake.modules.homeManager.bat = {
    programs.bat.enable = true;
    home.shellAliases = {
      cat = "bat";
    };
  };
}
