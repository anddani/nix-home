{ config, pkgs, lib, ... }: {
  home.file.starship = {
    target = ".config/starship.toml";
    text = ''
    add_newline = false

    [character]
    success_symbol = "[➜](bold green) "
    error_symbol = "[✗](bold red) "
    '';
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = false;
    autocd = true;
    dotDir = ".config/zsh";
    #defaultKeymap = "viins"; #vicmd or viins

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    shellAliases = {
      l = "ls -la";
    };

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true; # ignore commands starting with a space
      save = 20000;
      size = 20000;
      share = true;
    };

    initExtra = ''
      # fixes starship swallowing newlines
      precmd() {
        precmd() {
          echo
        }
      }

      # used for homebrew
      export XDG_DATA_DIRS=$XDG_DATA_DIRS:/opt/homebrew/share

      bindkey '^r' fzf-history-widget
      bindkey '^f' fzf-file-widget
      '';

      plugins = [
        {
          name = "fast-syntax-highlighting";
          src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
        }
        {
          name = "zsh-nix-shell";
          src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
        }
        {
          name = "forgit";
          src = "${pkgs.zsh-forgit}/share/zsh/zsh-forgit";
        }
        # {
        #   name = "fzf-tab";
        #   src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        # }
      ];
      prezto = {
        enable = true;
        caseSensitive = false;
        utility.safeOps = true;
        editor = {
          dotExpansion = true;
          keymap = "vi";
        };
        pmodules = [
          "autosuggestions"
          "directory"
          "editor"
          "git"
          "terminal"
        ];
      };
    };
  }
