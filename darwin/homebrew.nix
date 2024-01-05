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
      "skhd" # keybinding manager
      # broken nix builds
      "yabai" # tiling window manager

      # sketchybar
      "sketchybar" # macos bar alternative
      "jq" # json parser
      "gh" # github-cli

      "borders" # borders for windows
    ];
    casks = [
      # utilities
      "bartender" # hides mac bar icons
      "sf-symbols" # icons for sketchybar
    ];
    taps = [
      # default
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/core"
      "homebrew/services"
      # custom
      "koekeishiya/formulae" # yabai
      "FelixKratz/formulae" # sketchybar
    ];
  };
}
