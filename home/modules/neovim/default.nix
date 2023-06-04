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
      coc-rust-analyzer
      vim-nix
      which-key-nvim
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
          rust-analyzer = {
            enable = true;
            server = {
              path = "rust-analyzer";
            };
          };
          # https://github.com/NixOS/nixpkgs/issues/140774
          # haskell = {
          #   command = "haskell-language-server-wrapper";
          #   args = [ "--lsp" ];
          #   rootPatterns = [ ".stack.yaml" ".hie-bios" "BUILD.bazel" "cabal.config" "package.yaml" ];
          #   filetypes = [ "hs" "lhs" "haskell" ];
          #   initializationOptions = {
          #     languageServerHaskell = {
          #       hlintOn = true;
          #       maxNumberOfProblems = 10;
          #       completionSnippetsOn = true;
          #     };
          #   };
          # };
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
