{ config, pkgs, libs, ... }:
{
  home.file.".doom.d/".source = ./.doom.d;
}
