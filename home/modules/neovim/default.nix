{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox
      neogit
      nerdtree
      vim-nix
      which-key-nvim
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

    extraConfig = let
      luaRequire = module:
        builtins.readFile (builtins.toString
          ./config
          + "/${module}.lua");
      luaConfig = builtins.concatStringsSep "\n" (map luaRequire [
        "init"
        "neogit"
        "which-key"
      ]);
    in ''
      lua <<
      ${luaConfig}
      '';

    # extraConfig = ''
    #   colorscheme gruvbox
    #   filetype plugin indent on

    #   vnoremap  <leader>y  "+y
    #   nnoremap  <leader>Y  "+yg_
    #   nnoremap  <leader>y  "+y
    #   nnoremap  <leader>yy  "+yy

    #   nnoremap <leader>p "+p
    #   nnoremap <leader>P "+P
    #   vnoremap <leader>p "+p
    #   vnoremap <leader>P "+P
    #   '';
  };
}
