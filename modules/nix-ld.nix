{
  # I am against but mandatory for Rust Python tools (ruff, ty, ...)
  flake.modules.nixos.nix-ld = {
    programs.nix-ld = {
      enable = true;
    };
  };
}
