{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      neogit
      nerdtree
      nvim-lspconfig
      nvim-surround
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      rust-tools-nvim
      lazygit-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      vim-floaterm
      vim-nix
      which-key-nvim
      trouble-nvim
      elm-vim

      # Completion
      nvim-cmp
      cmp-buffer
      cmp-cmdline
      cmp-dap
      cmp-nvim-lsp
      cmp-nvim-lsp-document-symbol
      cmp-treesitter
      cmp-path
      cmp-vsnip
      vim-vsnip
      vim-vsnip-integ
    ];

    extraPackages = with pkgs; [
      rnix-lsp
      # https://github.com/NixOS/nixpkgs/issues/140774
      # haskell-language-server
      rustfmt
      rust-analyzer
      cabal-install
      elmPackages.elm
      elmPackages.elm-language-server
    ];

    # coc = {
    #   enable = true;
    #   settings = {
    #     languageserver = {
    #       nix = {
    #         command = "rnix-lsp";
    #         filetypes = [ "nix" ];
    #       };
    #       elmLS = {
    #         command = "elm-language-server";
    #         filetypes = [ "elm" ];
    #         rootPatterns = [ "elm.json" ];
    #       };
    #     };
    #     "codeLens.enable" = true;
    #   };
    # };

    extraConfig = let
      luaRequire = module:
        builtins.readFile (builtins.toString
          ./config
          + "/${module}.lua");
      luaConfig = builtins.concatStringsSep "\n" (map luaRequire [
        "init"
        "catppuccin"
        "cmp"
        "telescope"
        "treesitter"
        "neogit"
        "rust-tools"
        "elm"
        "which-key"
      ]);
    in ''
      lua <<
      ${luaConfig}
      '';
  };
}
