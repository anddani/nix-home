{ config, pkgs, libs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
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
      let mapleader = ","
      au Filetype json set tabstop=2 shiftwidth=2

      vnoremap  <leader>y  "+y
      nnoremap  <leader>Y  "+yg_
      nnoremap  <leader>y  "+y
      nnoremap  <leader>yy  "+yy

      nnoremap <leader>p "+p
      nnoremap <leader>P "+P
      vnoremap <leader>p "+p
      vnoremap <leader>P "+P
      '';
  };
}
