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
      nvim-lspconfig
      nvim-surround
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      rust-vim
      telescope-fzf-native-nvim
      telescope-nvim
      vim-floaterm
      vim-nix
      which-key-nvim

      # Completion
      nvim-cmp
      cmp-buffer
      cmp-cmdline
      cmp-dap
      cmp-nvim-lsp
      cmp-nvim-lsp-document-symbol
      cmp-path
    ];

    extraPackages = with pkgs; [
      rnix-lsp
      # https://github.com/NixOS/nixpkgs/issues/140774
      # haskell-language-server
      rust-analyzer
      cabal-install
      elmPackages.elm
      elmPackages.elm-language-server
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
        "cmp"
        "telescope"
        "treesitter"
        "neogit"
        "rust-tools"
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
