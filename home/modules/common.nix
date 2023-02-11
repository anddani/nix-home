{ config, pkgs, libs, ... }:
let
  ghcVersion = "ghc924";

  haskell-env = with pkgs.haskell.packages.${ghcVersion}; [
    hlint
    ghcid
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
    nodePackages.firebase-tools
    nodejs
    stack
    tmux
  ] ++ haskell-env;

  programs = {
    git = {
      enable = true;
    };

    tmux = {
      enable = true;
      terminal = "tmux-256color";
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
