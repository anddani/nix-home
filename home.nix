{ config, lib, pkgs, ... }:

let 
  config = import ./config.nix;
in {

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "andredanielsson";
  home.homeDirectory = "/Users/andredanielsson";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = with pkgs; [
    ripgrep
    htop
    tree
    wget

    # Development
    androidenv.androidPkgs_9_0.platform-tools
    jdk11
    tmux
    jq
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "fish";
      colors = {
        primary = {
          background = "#1d2021";
          foreground = "#ebdbb2";
        };
        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };

        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };
    };
  };

  programs.firefox = {
    enable = true;
    package = pkgs.Firefox;
  };

  programs.kitty = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      l = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      evil
      evil-magit
      evil-surround
      gruvbox-theme
      magit
      nix-mode
    ];
  };

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
  };

  programs.git = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = "colorscheme gruvbox";
    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox
    ];
  };

  xdg.configFile."kitty/kitty.conf".source = ./dotfiles/kitty.conf;
  home.file.".emacs.d/init.el".source = ./emacs/init.el;
  home.file.".ideavimrc".source = ./dotfiles/.ideavimrc;
}
