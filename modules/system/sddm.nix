{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.sddm;
in {
  options.my.sddm = {
    enable = lib.mkEnableOption "Enable SDDM Display Manager";
    # TODO: fix
    #keyboard_layouts = lib.mkOption {
    #  type = lib.types.str;
    #  default = "fr";
    #};
  };

  config = lib.mkIf cfg.enable {
    # Enable SDDM
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
    };

    # Make SDDM run on wayland without X server but need for fr layout
    services.xserver = {
      enable = false;

      #xkb.layout = cfg.keyboard_layouts;
      xkb.layout = "fr"; # TODO: enable multiple keyboard layout
    };
  };
}
