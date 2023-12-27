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

    doom-emacs = {
      url = "github:nix-community/nix-doom-emacs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ { self, flake-utils, doom-emacs, emacs, darwin, nixpkgs, hm }:
  flake-utils.lib.eachDefaultSystem (system: {})
  //
  {
    homeConfigurations = {
      mbp2019 = inputs.hm.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-darwin;
        modules = [ ./home/mac.nix ];
        extraSpecialArgs = { pkgsUnstable = inputs.nixpkgs.legacyPackages.x86_64-darwin; };
      };
      mbp2023 = inputs.hm.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
        modules = [
          ./home/mac.nix
          doom-emacs.hmModule
          { nixpkgs.overlays = [ inputs.emacs.overlay ]; }
        ];
        extraSpecialArgs = { pkgsUnstable = inputs.nixpkgs.legacyPackages.aarch64-darwin; };
      };
    };

    darwinConfigurations = {
      # nix build .#darwinConfigurations.anddaniM2.system
      # ./result/sw/bin/darwin-rebuild switch --flake .
      anddaniM2 = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [ ./darwin/mbp2023/configuration.nix ];
        inputs = { inherit darwin nixpkgs; };
      };
    };
  };
}
