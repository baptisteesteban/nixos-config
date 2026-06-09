{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs = {
      type = "github";
      repo = "nixpkgs";
      owner = "NixOS";
      ref = "nixos-26.05";
    };

    home-manager = {
      type = "github";
      repo = "home-manager";
      owner = "nix-community";
      ref = "release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-nix = {
      type = "github";
      repo = "nix";
      owner = "catppuccin";
      ref = "release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
  };

  outputs = {
    flake-parts,
    import-tree,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} (import-tree ./modules);
}
