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
    # ncdu
    ranger
    htop
    tree
    wget
    coreutils
    jq
    mpv
    pandoc

    dfu-util
    git-lfs
    gh
    google-cloud-sdk

    # Development
    scrcpy
    androidenv.androidPkgs_9_0.platform-tools
    haskell-ghc
    cabal2nix
    nix-prefetch-git
    docker
    # nixops
    jdk11
    nodePackages.typescript
    # nodePackages.firebase-tools
    nodejs-18_x
    node2nix
    stack
    tmux
    cmake
    ninja

    # Rust
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
  ] ++ haskell-env;

  programs = {
    git = {
      enable = true;
      userName = "André Danielsson";
      userEmail = "andredanielsson93@gmail.com";
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
  };
}
