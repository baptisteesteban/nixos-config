{
  config,
  lib,
  ...
}: let
  cfg = config.my.home.starship;
  cfg_bash = config.my.home.bash;
in {
  options.my.home.starship.enable = lib.mkEnableOption "Enable Starship in Home Manager";

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.starship = {
        enable = true;
        settings = {
          add_newline = false;

          format = "$nix_shell$username@$hostname $directory$git_branch$git_status$character";

          username = {
            show_always = true;
            format = "[$user]($style)";
            style_user = "bold green";
          };

          hostname = {
            ssh_only = false;
            format = "[$hostname]($style)";
            style = "bold yellow";
          };

          directory = {
            style = "bold blue";
            truncation_length = 3;
          };

          git_branch = {
            style = "bold purple";
          };

          git_status = {
            style = "red";
          };

          nix_shell = {
            symbol = "❄";
            format = "[$symbol]($style) ";
            style = "bold cyan";
          };

          character = {
            success_symbol = "[➜](bold green)";
            error_symbol = "[➜](bold red)";
          };
        };
      };
    })

    (lib.mkIf (cfg.enable && cfg_bash.enable) {
      programs.starship.enableBashIntegration = true;
    })
  ];
}
