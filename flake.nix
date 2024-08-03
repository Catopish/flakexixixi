{
  description = "Catopishs flake";

  inputs = {
  utils.url = "github:numtide/flake-utils";
  nixpkgs.url = "nixpkgs/nixos-24.05";
  home-manager.url = "github:nix-community/home-manager/release-24.05";
  home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self,nixpkgs,home-manager,utils,... }@inputs:
let
  lib = nixpkgs.lib;
system = "x86_64-linux";
pkgs = nixpkgs.legacyPackages.${system};
in
  {
  nixosConfigurations ={
al = lib.nixosSystem{
inherit system;
modules = [ ./configuration.nix ];
	 };
	};

  homeConfigurations ={
al = home-manager.lib.homeManagerConfiguration{
inherit pkgs;
modules = [ ./home.nix ];
	 };
	};
  };
}
