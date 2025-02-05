{ pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;

    # package = inputs.helix.packages.${pkgs.system}.default;

    settings = {
      theme = "onelight";
      editor = {
        true-color = true;
        file-picker.hidden = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        statusline = {
          left = [ "mode" "spinner" ];
          center = [ "file-name" ];
          right = [ "diagnostics" "selections" "position" "file-line-ending" "file-type" "version-control" ];
          separator = "|";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        indent-guides = {
          render = true;
          rainbow = "dim";
          character = "┆";
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
    };
    languages = {
      language-server = {
        nil = {
          command = lib.getExe pkgs.nil;
        };

        nixd = {
          command = lib.getExe pkgs.nixd;
        };

        typescript-lsp = {
          command = "typescript-language-server";
          args = [ "--stdio" ];
          config.tsserver.path = "${pkgs.typescript}/lib/node_modules/typescript/lib/";
        };

        tailwind-lsp = {
          command = lib.getExe pkgs.tailwindcss-language-server;
          args = [ "--stdio" ];
        };
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.nixpkgs-fmt;
          };
          language-servers = [ "nil" "nixd" ];
        }
        {
          name = "tsx";
          auto-format = true;
          formatter = {
            command = "eslint";
            args = [ "--stdin" ];
          };
          language-servers = [ "tailwind-lsp" ];
        }
      ];
    };
  };
}
