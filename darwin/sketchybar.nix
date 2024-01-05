{ ... }:
{
  home.file = {
    battery = {
      target = ".config/sketchybar/battery.sh";
      text = builtins.readFile ./sketchybar-plugins/battery.sh;
    };
    clock = {
      target = ".config/sketchybar/clock.sh";
      text = builtins.readFile ./sketchybar-plugins/clock.sh;
    };
    current-space = {
      target = ".config/sketchybar/current_space.sh";
      text = builtins.readFile ./sketchybar-plugins/current_space.sh;
    };
    front-app = {
      target = ".config/sketchybar/front_app.sh";
      text = builtins.readFile ./sketchybar-plugins/front_app.sh;
    };
    volume = {
      target = ".config/sketchybar/volume.sh";
      text = builtins.readFile ./sketchybar-plugins/volume.sh;
    };
    weather = {
      target = ".config/sketchybar/weather.sh";
      text = builtins.readFile ./sketchybar-plugins/weather.sh;
    };
    sketchybar = {
      executable = true;
      target = ".config/sketchybar/sketchybarrc";
      text = ''
        #!/bin/bash

        FONT_FACE="JetBrainsMono Nerd Font"
        PLUGIN_DIR="$HOME/.config/sketchybar"

        sketchybar --bar \
            height=32 \
            color=0x00000000 \
            margin=0 \
            sticky=on \
            padding_left=23 \
            padding_right=23 \
            notch_width=188 \
            display=main

        # Alternatiive background colors
        # label.color=0xffffffff
        # background.color=0x9924273a
        sketchybar --default \
            background.color=0x66494d64 \
            background.corner_radius=5 \
            background.padding_right=5 \
            background.height=26 \
            icon.font="$FONT_FACE:Medium:15.0" \
            icon.padding_left=5 \
            icon.padding_right=5 \
            label.font="$FONT_FACE:Medium:12.0" \
            label.color=0xffcad3f5 \
            label.y_offset=0 \
            label.padding_left=0 \
            label.padding_right=5

        sketchybar --add item current_space left \
            --set current_space \
            background.color=0xfff5a97f \
            icon.color=0xff24273a \
            label.drawing=off \
            script="$PLUGIN_DIR/current_space.sh" \
            --subscribe current_space space_change mouse.clicked

        sketchybar --add item front_app left \
            --set front_app \
            background.color=0xffa6da95 \
            background.padding_left=0 \
            background.padding_right=0 \
            icon.y_offset=1 \
            icon.color=0xff24273a \
            label.drawing=no \
            script="$PLUGIN_DIR/front_app.sh" \
            --add item front_app.separator left \
            --set front_app.separator \
            background.color=0x00000000 \
            background.padding_left=-3 \
            icon= \
            icon.color=0xffa6da95 \
            icon.font="$FONT_FACE:Bold:20.0" \
            icon.padding_left=0 \
            icon.padding_right=0 \
            icon.y_offset=1 \
            label.drawing=no \
            --add item front_app.name left \
            --set front_app.name \
            background.color=0x00000000 \
            background.padding_right=0 \
            icon.drawing=off \
            label.font="$FONT_FACE:Bold:12.0" \
            label.drawing=yes

        sketchybar --add item weather.moon q \
            --set weather.moon \
            background.color=0x667dc4e4 \
            background.padding_right=-1 \
            icon.color=0xff181926 \
            icon.font="$FONT_FACE:Bold:22.0" \
            icon.padding_left=4 \
            icon.padding_right=3 \
            label.drawing=off \
            --subscribe weather.moon mouse.clicked

        sketchybar --add item weather q \
            --set weather \
            icon= \
            icon.color=0xfff5bde6 \
            icon.font="$FONT_FACE:Bold:15.0" \
            update_freq=1800 \
            script="$PLUGIN_DIR/weather.sh" \
            --subscribe weather system_woke

        sketchybar --add bracket front_app_bracket \
            front_app \
            front_app.separator \
            front_app.name \
            --subscribe front_app front_app_switched

        sketchybar --add item clock right \
            --set clock \
            icon=󰃰 \
            icon.color=0xffed8796 \
            update_freq=10 \
            script="$PLUGIN_DIR/clock.sh"

        sketchybar --add item battery right \
            --set battery \
            update_freq=20 \
            script="$PLUGIN_DIR/battery.sh"

        sketchybar --add item volume right \
            --set volume \
            icon.color=0xff8aadf4 \
            label.drawing=true \
            script="$PLUGIN_DIR/volume.sh" \
            --subscribe volume volume_change

            ##### Finalizing Setup #####
            sketchybar --update
            sketchybar --trigger space_change
      '';
    };
  };
}
