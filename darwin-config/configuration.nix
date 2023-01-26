{ lib, config, pkgs, ... }:

with lib;

let
  homeDir = builtins.getEnv("HOME");
  hm = builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz;
in {
  # TODO: Find a better way of doing this
  environment.darwinConfig = "${homeDir}/git/nix-home/darwin-config/configuration.nix";

  system.stateVersion = 4;
  nix.package = pkgs.nix;

  nix.settings.experimental-features = "nix-command flakes";

  # services.skhd.enable = true;
  # services.skhd.skhdConfig = builtins.readFile ../dotfiles/skhd.conf;

  #services.cron = {
  #  enable = true;
  #  systemCronJobs = [
  #    ""
  #  ];
  #};

  environment = {
    systemPackages = with pkgs; [
      home-manager
    ];
    shells = [ pkgs.fish ];
    variables = {
      EDITOR = "vim";
    };
  };

  programs.bash.enable = false;
  programs.zsh.enable = false;
  programs.fish.enable = true;
}
