{ config, pkgs, lib, ... }: {
  home.file.yabai = {
    executable = true;
    target = ".config/yabai/yabairc";
    text = ''
      #!/usr/bin/env sh

      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

      # layout
      yabai -m config layout bsp
      yabai -m config auto_balance on
      yabai -m config focus_follows_mouse autoraise

      # gaps
      yabai -m config top_padding    8
      yabai -m config bottom_padding 8
      yabai -m config left_padding   8
      yabai -m config right_padding  8
      yabai -m config window_gap     8

      # rules
      yabai -m rule --add app="^System Settings$"    manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add app="Bitwarden"            manage=off
      yabai -m rule --add title="Preferences$"       manage=off
      yabai -m rule --add title="Settings$"          manage=off

      echo "yabai configuration loaded"
    '';
  };

  home.file.borders = {
    target = ".config/borders/bordersrc";
    text = ''
    #!/bin/bash

    options=(
      style=round
      width=6.0
      hidpi=off
      active_color=0xffe2e2e3
      inactive_color=0xff414550
    )

      borders "''${options[@]}"
    '';
  };

  home.file.skhd = {
    target = ".config/skhd/skhdrc";
    text =
      let
        yabai = "/opt/homebrew/bin/yabai";
        modifier = "cmd + ctrl";
      in
        ''
        cmd - return : alacritty msg create-window

        # Change focused space
        cmd - tab         : ${yabai} -m space --focus next
        cmd + shift - tab : ${yabai} -m space --focus prev

        ${modifier} - 1 : ${yabai} -m space --focus 1
        ${modifier} - 2 : ${yabai} -m space --focus 2
        ${modifier} - 3 : ${yabai} -m space --focus 3
        ${modifier} - 4 : ${yabai} -m space --focus 4
        ${modifier} - 5 : ${yabai} -m space --focus 5
        ${modifier} - 6 : ${yabai} -m space --focus 6
        ${modifier} - 7 : ${yabai} -m space --focus 7

        # Focus window
        ${modifier} - h : ${yabai} -m window --focus west
        ${modifier} - j : ${yabai} -m window --focus south
        ${modifier} - k : ${yabai} -m window --focus north
        ${modifier} - l : ${yabai} -m window --focus east

        # Show desktop
        ${modifier} - e : ${yabai} -m space --toggle show-desktop

        # Toggle fullscreen
        ${modifier} - f : ${yabai} -m window --toggle zoom-fullscreen

        # Toggle layout
        ${modifier} - d : ${yabai} -m space --layout $(${yabai} -m query --spaces --space | jq -r 'if .type == "bsp" then "stack" else "bsp" end')
        '';
      };
    }
