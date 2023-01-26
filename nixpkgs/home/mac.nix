{ config, lib, pkgs, ... };
{
  imports = [
    ./modules/home-manager.nix
    ./modules/common.nix
    ./modules/fish.nix
    ./modules/neovim.nix
    ./modules/emacs.nix
    ./modules/kitty.nix
  ];

  home = {
    username = "andredanielsson";
    homeDirectory = "/Users/andredanielsson";
    stateVersion = "20.09";
  };
  # TODO
  # home.file.".ideavimrc".source = ./dotfiles/.ideavimrc;
}
