{ config, pkgs, libs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      coc-elm
      gruvbox

      neogit
      nerdtree

      vim-nix
    ];

    coc = {
      enable = true;
      settings = {
        languageserver = {
          nix = {
            command = "rnix-lsp";
            filetypes = [ "nix" ];
          };
          elmLS = {
            command = "elm-language-server";
            filetypes = [ "elm" ];
            rootPatterns = [ "elm.json" ];
          };
        };
        "codeLens.enable" = true;
      };
    };
    extraConfig = ''
      colorscheme gruvbox
      filetype plugin indent on
      set tabstop=4
      set shiftwidth=4
      set expandtab
      au Filetype json set tabstop=2 shiftwidth=2
      '';
  };
}
