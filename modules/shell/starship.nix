{
  flake.modules.homeManager.starship = {
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
  };
}
