# My NixOS configuration

## Description

This repository contains an experimental NixOS configuration.

It has the following host:

* `foras`: A very old laptop that I use to learn NixOS configuration

To build the NixOS configuration, just type the following command:

```sh
$ nixos-rebuild switch --flake /path/to/this/repo#host
```

## TODO

* Think about `DeterminateSystems/magic-nix-cache-action` for CI
* Special wifi option for network manager system module
* Enable keyboard layout options in SDDM
* Handle battery notification + color
* Think about using nerd-fonts for waybar