{
  flake.modules.nixos.base = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vim # Basic editor
      git # Version control
      btop # Monitor
    ];
  };
}
