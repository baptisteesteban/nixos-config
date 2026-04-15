{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*.lre.epita.fr" = {
        user = "besteban";
      };

      lre-proxyjump = {
        host = "*.lre.epita.fr !ssh.lre.epita.fr !gitlab.lre.epita.fr";
        proxyJump = "ssh.lre.epita.fr";
      };
    };
  };
}
