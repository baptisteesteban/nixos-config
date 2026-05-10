{
  flake.modules.homeManager.mako = {
    services.mako = {
      enable = true;
      settings = {
        layer = "overlay";
      };
    };
  };
}
