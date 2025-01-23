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
      # "homebrew/cask"
      # "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      # "homebrew/core"
      "homebrew/services"
      # custom
      "hashicorp/tap"
      "railwaycat/emacsmacport"
    ];
  };
}
