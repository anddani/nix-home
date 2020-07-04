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

  home.stateVersion = "20.03";

  home.packages = with pkgs; [
    ripgrep
    htop
    tree
    wget
    jq

    # Development
    androidenv.androidPkgs_9_0.platform-tools
    jdk11
    tmux
  ];

  # programs.firefox = {
  #   enable = true;
  #   package = pkgs.Firefox;
  # };

  programs.kitty = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    plugins = [{
      name="foreign-env";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "plugin-foreign-env";
        rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
        sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
      };
    }];
    promptInit = ''
      if test -e '/Users/andredanielsson/.nix-profile/etc/profile.d/nix.sh'
        fenv source '/Users/andredanielsson/.nix-profile/etc/profile.d/nix.sh'
      end
    '';
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
      evil-leader
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
