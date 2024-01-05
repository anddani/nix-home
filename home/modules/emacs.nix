{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
  ];
  programs.emacs.enable = true;
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./.doom.d;
  };
  home.file.".doom.d/".source = ./doom.d;

}
