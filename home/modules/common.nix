{ pkgs, ... }:
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
    p7zip
    unar

    gh

    starship # terminal prompt
    slides # terminal presentation tool

    # LSPs
    tailwindcss-language-server
    nil
    nixd
    rust-analyzer
    nixpkgs-fmt
    nodePackages_latest.typescript-language-server

    # Development
    scrcpy
    android-tools
    libusb1
    nix-prefetch-git
    docker
    maven
    # nixops
    jdk17
    vscode-langservers-extracted
    nodePackages.typescript
    nodePackages.pnpm
    nodePackages.firebase-tools
    nodejs-18_x
    tmux

    (google-cloud-sdk.withExtraComponents ([
      google-cloud-sdk.components.gke-gcloud-auth-plugin
      google-cloud-sdk.components.cloud_sql_proxy
      google-cloud-sdk.components.cbt
    ]))

    # QMK
    dfu-util
    dfu-programmer

    python3

    # Rust
    # rustc
    # rustup
    cargo
    cargo-lambda
    # rustfmt
    # clippy
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

    yazi = {
      enable = true;
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
