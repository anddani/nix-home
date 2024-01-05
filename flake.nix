{
  description = "My machines";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sketchybar = {
    #   url = "";
    #   flake = false;
    # };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
    };
  };
  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs:
    let
      nixpkgsConfig = {
        allowUnfree = true;
        allowUnsupportedSystem = false;
      };
      overlays = [
        inputs.emacs-overlay.overlay
      ];
      user = "andredanielsson";
    in
      {
        # M2 mbp 2023
        darwinConfigurations.mbp2023 = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          # makes all inputs availble in imported files
          specialArgs = { inherit inputs; };
          modules = [
            ./darwin/mbp2023/configuration.nix
            ./darwin/homebrew.nix
            ({ pkgs, ... }: {
              nixpkgs.overlays = overlays;

              nix = {
                # Enable flakes by default
                package = pkgs.nixFlakes;
                configureBuildUsers = true;
                settings = {
                  allowed-users = [ user ];
                  experimental-features = [ "nix-command" "flakes" ];
                  extra-platforms = [ "x86_64-darwin" "aarch64-darwin" ];
                };
              };

              users.users.${user} = {
                home = "/Users/${user}";
                shell = pkgs.zsh;
              };
            })
            home-manager.darwinModule
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                # makes all inputs available in imported files for hm
                extraSpecialArgs = { inherit inputs; };
                users.andredanielsson = { ... }: with inputs; {
                  imports = [
                    ./home/mac.nix
                    ./darwin
                  ];
                };
              };
            }
          ];
        };
      };
    }
