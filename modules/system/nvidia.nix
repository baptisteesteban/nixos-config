{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.nvidia;
in {
  options.my.nvidia.enable = lib.mkEnableOption "Enable NVIDIA in system";

  config = lib.mkIf cfg.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
    };

    environment.systemPackages = with pkgs; [cudatoolkit nvtopPackages.nvidia];

    environment.variables = {
      CUDA_PATH = "${pkgs.cudatoolkit}";
    };
  };
}
