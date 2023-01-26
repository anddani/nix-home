{ lib, config, pkgs, ... }:
with lib;
let
  hm = builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz;
in
{
  nix.package = pkgs.nix;
  nix.settings.experimental-features = "nix-command flakes";

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  programs = {
    bash.enable = false;
    zsh.enable = false;
    fish.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      home-manager
    ];
    shells = [ pkgs.fish ];
    variables = {
      EDITOR = "vim";
    };
  };

  system.stateVersion = 4;
}
