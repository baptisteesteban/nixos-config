{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.my.users;
in {
  options.my.users.enable = lib.mkEnableOption "Enable base users of the configurations";

  config = lib.mkIf cfg.enable {
    users.users.baptou = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      initialPassword = "test"; # TODO: Change
      shell = pkgs.bash;
    };
  };
}
