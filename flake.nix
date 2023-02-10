{
  description = "Home-Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, flake-utils, darwin, nixpkgs, hm }:
  flake-utils.lib.eachDefaultSystem (system: {})
  //
  {
    homeConfigurations = {
      mbp2019 = inputs.hm.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-darwin;
        modules = [ ./home/mac.nix ];
        extraSpecialArgs = { pkgsUnstable = inputs.nixpkgs.legacyPackages.x86_64-darwin; };
      };
    };

    darwinConfigurations = {
      # nix build .#darwinConfigurations.mbp2019.system
      # ./result/sw/bin/darwin-rebuild switch --flake .
      Danielsson = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [ ./darwin/mbp2019/configuration.nix ];
        inputs = { inherit darwin nixpkgs; };
      };
    };
  };
}
