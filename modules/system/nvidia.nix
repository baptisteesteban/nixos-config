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
    services.xserver.videoDrivers = ["modesetting" "nvidia"];

    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = false;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      open = true;
      nvidiaSettings = true;
    };

    environment.systemPackages = with pkgs; [cudatoolkit nvtopPackages.nvidia];

    environment.variables = {
      CUDA_PATH = "${pkgs.cudatoolkit}";
    };
  };
}
