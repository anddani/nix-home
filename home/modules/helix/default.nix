{ pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_frappe";
      keys = {
        normal = {
          C-y = "scroll_up";
          C-e = "scroll_down";
        };
      };
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
        biome = {
          command = "biome";
          args = [ "lsp-proxy" ];
        };

        nil = {
          command = lib.getExe pkgs.nil;
        };

        nixd = {
          command = lib.getExe pkgs.nixd;
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
          name = "typescript";
          auto-format = true;
          language-servers = [
            "biome"
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
          ];
        }
        {
          name = "tsx";
          auto-format = true;
          language-servers = [
            "biome"
            "tailwind-lsp"
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
          ];
        }
      ];
    };
  };
}
