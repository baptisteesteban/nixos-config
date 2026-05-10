{
  flake.modules.homeManager.z80 = {pkgs, ...}: {
    home.packages = with pkgs; [sjasmplus fuse-emulator];
  };
}
