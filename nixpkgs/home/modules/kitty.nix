{ config, lib, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
  };
  xdg.configFile."kitty/kitty.conf".source = ./configs/kitty.conf;
}
