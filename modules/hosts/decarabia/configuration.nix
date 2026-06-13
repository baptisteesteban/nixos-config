{
  inputs,
  config,
  ...
}: {
  flake.nixosConfigurations.decarabia = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      config.flake.modules.nixos.host-decarabia
      inputs.home-manager.nixosModules.home-manager
      config.flake.modules.nixos.baptou-decarabia
      config.flake.modules.nixos.base
      config.flake.modules.nixos.desktop
      config.flake.modules.nixos.docker
      config.flake.modules.nixos.graphics
    ];
  };

  flake.modules.nixos.host-decarabia = {pkgs, ...}: {
    # Boot options
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Local
    time.timeZone = "Europe/Paris";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "fr";

    services.udev.extraRules = ''
      SUBSYSTEM=="drm", KERNEL=="card*", KERNELS=="0000:00:02.0", SYMLINK+="dri/igpu"
    '';

    environment.variables = {
      AQ_DRM_DEVICES = "/dev/dri/igpu"; # Only run graphic interface in integrated GPU
    };

    networking.hostName = "decarabia";
    programs.fish.enable = true;
    users.users.baptou = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      initialPassword = "test"; # TODO: Change
      shell = pkgs.fish;
    };

    system.stateVersion = "25.11";
  };

  flake.modules.nixos.baptou-decarabia = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.baptou = {
      home.stateVersion = "25.11";
      imports = [
        config.flake.modules.homeManager.baptou-base
        config.flake.modules.homeManager.brave
        config.flake.modules.homeManager.direnv
        config.flake.modules.homeManager.fastfetch
        config.flake.modules.homeManager.gitg
        config.flake.modules.homeManager.lazygit
        config.flake.modules.homeManager.linux-desktop
        config.flake.modules.homeManager.shell
        config.flake.modules.homeManager.vscode
        config.flake.modules.homeManager.basedev
        config.flake.modules.homeManager.python
        config.flake.modules.homeManager.z80
        config.flake.modules.homeManager.obsidian
      ];
      home.packages = [config.flake.packages.x86_64-linux.slicer];

      wayland.windowManager.hyprland.settings.monitor = [
        {
          output = "eDP-1";
          scale = 1;
          mode = "highres";
          position = "auto-right";
        }
        {
          output = "HDMI-A-1";
          scale = 1;
          position = "1920x0";
          mode = "highres";
        }
        {
          output = "DP-3";
          scale = 1;
          position = "1920x0";
          mode = "highres";
        }
      ];
    };
  };
}
