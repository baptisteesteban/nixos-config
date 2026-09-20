{
  flake.modules.homeManager.baptou-base = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Baptiste Esteban";
          email = "baptiste.esteban@epita.fr";
        };
        core.editor = "vim";
        init.defaultBranch = "main";
      };
    };
  };
}
