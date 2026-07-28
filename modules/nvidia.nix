{
  flake.modules.nixos.nvidia = {
    pkgs,
    config,
    ...
  }: {
    hardware.nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    services.xserver.videoDrivers = ["nvidia"];

    environment.systemPackages = [pkgs.nvtopPackages.nvidia];
  };
}
