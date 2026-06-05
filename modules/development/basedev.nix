{
  flake.modules.homeManager.basedev = {pkgs, ...}: {
    home.packages = with pkgs; [
      gcc
      gdb
      gnumake
      valgrind
      ltrace
      strace
      tokei
      clang-tools
    ];
  };
}
