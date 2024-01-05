{ config, pkgs, libs, ... }:
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

    starship # terminal prompt
    slides # terminal presentation tool

    # Development
    scrcpy
    androidenv.androidPkgs_9_0.platform-tools
    libusb
    nix-prefetch-git
    docker
    # terraform
    # nixops
    jdk17
    nodePackages.typescript
    # nodePackages.firebase-tools
    nodejs-18_x
    node2nix
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
  ];

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

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache --exclude vendor";
      defaultOptions = [
        "--border sharp"
        "--inline-info"
        "--bind ctrl-h:preview-down,ctrl-l:preview-up"
      ];
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
