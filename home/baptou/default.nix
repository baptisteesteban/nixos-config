{pkgs, ...}: {
  imports = [
    ./git.nix
    ./ssh.nix
  ];

  home.username = "baptou";
  home.homeDirectory = "/home/baptou";

  xdg.enable = true;

  # Shell
  my.home.bash.enable = true;
  my.home.starship.enable = true;

  # Programs
  my.home.btop.enable = true;
  my.home.direnv.enable = true;
  my.home.fastfetch.enable = true;
  my.home.lazygit.enable = true;

  # Development
  my.home.basedev.enable = true;
  my.home.python.enable = true;
  my.home.vscode.enable = true;

  # Browser
  my.home.brave.enable = true;

  # Graphical
  my.home.hyprland.enable = true;
  my.home.waybar.enable = true;
  my.home.wofi.enable = true;
  my.home.kitty.enable = true;
  my.home.mako.enable = true;

  # Theme
  my.home.catppuccin.enable = true;

  # Misc
  my.home.mines.enable = true;

  # Extra packages
  home.packages = with pkgs; [
    nautilus # File manager
    eog # Image viewver
    pavucontrol # Sound control
    evince # PDF Reader
    gimp # Image Processing
  ];

  # Environment variables
  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "kitty";
    BROWSER = "brave";
    NIXOS_OZONE_WL = "1";
  };

  home.stateVersion = "25.11";
}
