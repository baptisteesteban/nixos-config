{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs = {
      type = "github";
      repo = "nixpkgs";
      owner = "NixOS";
      ref = "nixos-25.11";
    };
  };

  outputs = {nixpkgs, ...}: {
    nixosConfigurations = 
    let 
      system = "x86_64-linux";
    in  
    {
      foras = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./configuration.nix];
      };
    };
  };
}