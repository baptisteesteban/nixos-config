{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.brave;
in {
  options.my.home.brave.enable = lib.mkEnableOption "Enable Brave in Home Manager";

  config = lib.mkIf cfg.enable {
    programs.brave = {
      enable = true;
      extensions = [
        {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
        {id = "clngdbkpkpeebahjckkjfobafhncgmne";} # Stylus
      ];
    };
  };
}
