{ lib, pkgs, ... }:
with lib;
{
  nix.package = pkgs.nix;
  nix.configureBuildUsers = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

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
