{ config, pkgs, libs, ... }:
let
  ghcVersion = "ghc924";

  haskell-env = with pkgs.haskell.packages.${ghcVersion}; [
    hlint
    cabal-install
    sqlite-simple
  ];
  haskell-ghc = pkgs.haskell.packages.${ghcVersion}.ghcWithPackages (p: [
    p.mtl
    p.lens
    p.hspec
  ]);
in
{
  home.packages = with pkgs; [
    ripgrep

    # https://github.com/NixOS/nixpkgs/issues/214545
    ncdu
    ranger
    htop
    tree
    wget
    coreutils
    jq
    mpv
    pandoc

    git-lfs
    gh
    google-cloud-sdk

    # Development
    scrcpy
    androidenv.androidPkgs_9_0.platform-tools
    haskell-ghc
    cabal2nix
    libusb
    nix-prefetch-git
    docker
    terraform
    # nixops
    jdk17
    nodePackages.typescript
    # nodePackages.firebase-tools
    nodejs-18_x
    node2nix
    stack
    tmux
    cmake
    ninja
    graphviz

    # QMK
    dfu-util
    dfu-programmer

    python3

    elmPackages.elm-language-server

    # Rust
    rustc
    cargo
    cargo-lambda
    rustfmt
    rust-analyzer
    clippy
  ] ++ haskell-env;

  programs = {
    git = {
      enable = true;
      userName = "André Danielsson";
      userEmail = "andredanielsson93@gmail.com";
      extraConfig = {
        pull = {
          rebase = true;
        };
        fetch = {
          prune = true;
        };
      };
    };

    tmux = {
      enable = true;
      terminal = "tmux-256color";
    };

    fish = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    lazygit = {
      enable = true;
      settings = {
        git = {
          merging = {
            args = "--no-ff";
          };
          log = {
            showGraph = "always";
          };
        };
      };
    };
  };
}
