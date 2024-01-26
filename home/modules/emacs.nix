{ config, pkgs, libs, ... }:
{
  programs.emacs.enable = true;
  home.file.".doom.d/".source = ./doom.d;
}
