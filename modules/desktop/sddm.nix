{
  flake.modules.nixos.sddm = {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # Make SDDM run on wayland without X server but need for fr layout
    services.xserver = {
      enable = false;

      #xkb.layout = cfg.keyboard_layouts;
      xkb.layout = "fr"; # TODO: enable multiple keyboard layout
    };
  };
}
