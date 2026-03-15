# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "foras"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "fr";  

  services.xserver = {
    enable = true;

    xkb.layout = "fr";

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
      ];
    };
  };
  programs.i3lock.enable = true;
  services.displayManager = {
    sddm.enable = true;
    defaultSession = "none+i3";
  };
  services.libinput.enable = true;

  users.users.baptou = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
    ];
  };


  environment.systemPackages = with pkgs; [
    vim
    kitty
    brave
    rofi
    git
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [jnoortheen.nix-ide];
    })
    nixfmt
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];
  };


  system.stateVersion = "25.11";
}

