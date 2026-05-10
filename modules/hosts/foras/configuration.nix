{
  inputs,
  config,
  ...
}: {
  flake.nixosConfigurations.foras = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      config.flake.modules.nixos.host-foras
      inputs.home-manager.nixosModules.home-manager
      config.flake.modules.nixos.baptou-foras
      config.flake.modules.nixos.base
      config.flake.modules.nixos.desktop
      #config.flake.modules.nixos.docker
    ];
  };

  flake.modules.nixos.host-foras = {pkgs, ...}: {
    # Boot options
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Local
    time.timeZone = "Europe/Paris";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "fr";

    environment.variables = {
      AQ_DRM_DEVICES = "/dev/dri/card1"; # Only run graphic interface in integrated GPU
    };

    networking.hostName = "foras";
    programs.fish.enable = true;
    users.users.baptou = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      initialPassword = "test"; # TODO: Change
      shell = pkgs.fish;
    };

    system.stateVersion = "25.11";
  };

  flake.modules.nixos.baptou-foras = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.baptou = {
      home.stateVersion = "25.11";
      imports = [
        config.flake.modules.homeManager.baptou-base
        config.flake.modules.homeManager.brave
        config.flake.modules.homeManager.direnv
        config.flake.modules.homeManager.fastfetch
        config.flake.modules.homeManager.lazygit
        config.flake.modules.homeManager.linux-desktop
        config.flake.modules.homeManager.shell
        config.flake.modules.homeManager.vscode
        config.flake.modules.homeManager.basedev
        config.flake.modules.homeManager.python
        config.flake.modules.homeManager.z80
      ];
      home.packages = [config.flake.packages.x86_64-linux.slicer];
    };
  };
}
