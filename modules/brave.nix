{
  flake.modules.homeManager.brave = {
    programs.brave = {
      enable = true;
      extensions = [
        {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
        {id = "clngdbkpkpeebahjckkjfobafhncgmne";} # Stylus
      ];
    };
  };
}
