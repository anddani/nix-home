{ config, pkgs, libs, ... }:
let
  ghcVersion = "ghc924";

  nodejs = pkgs.nodejs-14_x;

  nodeEnv = import ./node-packages/node-env.nix {
    inherit (pkgs) stdenv lib python2 runCommand writeTextFile writeShellScript;
    inherit pkgs nodejs;
    libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
  };

  extraNodePackages = import ./node-packages/node-packages.nix {
    inherit (pkgs) fetchurl nix-gitignore stdenv lib fetchgit;
    inherit nodeEnv;
  };

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
    nodejs
    node2nix
    extraNodePackages.fs-extra
    stack
    tmux
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
