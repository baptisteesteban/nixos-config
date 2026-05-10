{
  flake.modules.homeManager.python = {pkgs, ...}: {
    home.packages = [
      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.numpy
        python-pkgs.matplotlib
        python-pkgs.ipython
        python-pkgs.notebook
      ]))
    ];
  };
}
