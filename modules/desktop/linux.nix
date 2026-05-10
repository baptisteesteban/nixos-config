{config, ...}: {
  flake.modules.nixos.desktop = {
    imports = [
      config.flake.modules.nixos.sddm
      config.flake.modules.nixos.hyprland
    ];
  };

  flake.modules.homeManager.linux-desktop = {pkgs, ...}: {
    imports = [
      config.flake.modules.homeManager.catppuccin
      config.flake.modules.homeManager.hypridle
      config.flake.modules.homeManager.hyprland
      config.flake.modules.homeManager.hyprlock
      config.flake.modules.homeManager.hyprpaper
      config.flake.modules.homeManager.kitty
      config.flake.modules.homeManager.mako
      config.flake.modules.homeManager.swayosd
      config.flake.modules.homeManager.waybar
      config.flake.modules.homeManager.wofi
    ];

    home.packages = with pkgs; [
      evince # PDF Reader
      eog # Picture viewver
      gimp # Image manipulation
      pavucontrol # Sound control
    ];
  };
}
