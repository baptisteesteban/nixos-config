{
  flake.modules.nixos.hyprland = {pkgs, ...}: {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    services.libinput.enable = true;

    # Here, we follow the advices here: https://wiki.hypr.land/Useful-Utilities/Must-have/
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [
      kitty # Terminal
      mako # Notification deamon
      noto-fonts # Default fonts
    ];
  };

  flake.modules.homeManager.hyprland = {
    config,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [nwg-displays];

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false; # uwsm handles session management
      configType = "lua";
      settings = {
        mod = {
          _var = "SUPER";
        };
        terminal = {
          _var = "kitty";
        };

        config = {
          input = {
            kb_layout = "fr";
            touchpad = {
              clickfinger_behavior = 1;
              natural_scroll = true;
            };
          };

          dwindle = {
            force_split = 2;
          };
        };
      };
    };

    # Handle cursor in Hyprland configuration
    home.pointerCursor = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
