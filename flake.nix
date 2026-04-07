{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs = {
      type = "github";
      repo = "nixpkgs";
      owner = "NixOS";
      ref = "nixos-25.11";
    };

    home-manager = {
      type = "github";
      repo = "home-manager";
      owner = "nix-community";
      ref = "release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-nix = {
      type = "github";
      repo = "nix";
      owner = "catppuccin";
      ref = "release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    catppuccin-nix,
    ...
  }: let
    system = "x86_64-linux";
    baptouHomeManagerConfig = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.baptou = {
        imports = [
          ./modules/home
          ./home/baptou
          catppuccin-nix.homeModules.catppuccin
        ];
      };
    };
  in {
    nixosConfigurations = {
      foras = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/foras
          ./modules/system
          home-manager.nixosModules.home-manager
          baptouHomeManagerConfig
        ];
      };

      #decarabia = nixpkgs.lib.nixosSystem {
      #  inherit system;
      #  modules = [
      #    ./hosts/decarabia
      #    ./modules/system
      #    home-manager.nixosModules.home-manager
      #    baptouHomeManagerConfig
      #  ];
      #};
    };

    formatter.${system} = let
      pkgs = import nixpkgs {inherit system;};
    in
      pkgs.alejandra;
  };
}
