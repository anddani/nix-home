{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    brews = [
      "helm"
      "terraform"
    ];
    casks = [
      # utilities
      "bartender" # hides mac bar icons
      "sf-symbols" # icons for sketchybar
      "emacs-mac"
      "alacritty"
    ];
    taps = [
      # default
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/services"
      # custom
      "hashicorp/tap"
      "railwaycat/emacsmacport"
    ];
  };
}
