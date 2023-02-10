{ config, lib, pkgs, ... }:
{
  imports = [
    ./modules/home-manager.nix
    ./modules/common.nix
    ./modules/fish.nix
    ./modules/neovim
    ./modules/emacs.nix
    ./modules/kitty.nix
  ];

  home = {
    username = "andredanielsson";
    homeDirectory = "/Users/andredanielsson";
    stateVersion = "20.09";
  };
  home.file.".ideavimrc".text = ''
    set surround
    set incsearch
    set hlsearch

    let mapleader = ","

    map <Space> zz
    map <leader>rc :action ReformatCode<CR>
    map <leader>gf :action GotoFile<CR>
    map <leader>gc :action GotoClass<CR>
    map <leader>gs :action GotoSymbol<CR>
  '';
}
