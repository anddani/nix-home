{ lib, pkgs, ... }:
with lib;
{
  nix.package = pkgs.nix;
  nix.configureBuildUsers = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.extra-platforms = [ "x86_64-darwin" "aarch64-darwin" ];

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  users.users.andredanielsson = {
    home = "/Users/andredanielsson";
    shell = pkgs.fish;
  };

  programs = {
    bash.enable = false;
    zsh.enable = false;
    fish.enable = true;
  };

  environment = {
    shells = [ pkgs.fish ];
    loginShell = "/run/current-system/sw/bin/fish";
    variables = {
      EDITOR = "vim";
    };
  };

  system.stateVersion = 4;
}
