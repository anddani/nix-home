{ config, lib, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      evil
      evil-leader
      evil-surround
      evil-collection
      gruvbox-theme
      helm
      magit
      nix-mode
    ];
  };
}
