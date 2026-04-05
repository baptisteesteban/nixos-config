{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim # Editor
    git # Version control
    btop # Monitor
  ];

  services.dbus.enable = true;
}
