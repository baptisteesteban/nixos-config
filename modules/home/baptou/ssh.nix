{
  flake.modules.homeManager.baptou-base = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings = {
        "*.lre.epita.fr" = {
          User = "besteban";
        };

        "gpu-worker-3.lab.lre.epita.fr" = {
        };

        "*.lre.epita.fr !ssh.lre.epita.fr !gitlab.lre.epita.fr" = {
          ProxyJump = "ssh.lre.epita.fr";
        };
      };
    };
  };
}
