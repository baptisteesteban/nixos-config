{
  flake.modules.nixos.sddm = {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # Make SDDM run on wayland without X server but need for fr layout
    services.xserver.xkb.layout = "fr";
  };
}
