{ config, lib, pkgs, ... }:
{
  programs.emacs.enable = true;
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./.doom.d;
  };
}
