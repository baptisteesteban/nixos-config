{
  config,
  lib,
  ...
}: let
  cfg = config.my.nix;
in {
  options.my.nix = {
    enable = lib.mkEnableOption "Enable nix configuration";
  };

  config = lib.mkIf cfg.enable {
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 10d";
      };
    };

    nixpkgs.config = {
      allowUnfree = true;
    };
  };
}
