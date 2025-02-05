{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 1;
        dynamic_title = true;
        dynamic_padding = true;
        decorations = "buttonless";
        dimensions = { lines = 0; columns = 0; };
        padding = { x = 5; y = 5; };
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      mouse = { hide_when_typing = true; };

      font = let fontname = "FiraCode Nerd Font Mono"; in
        {
          normal = { family = fontname; style = "Bold"; };
          bold = { family = fontname; style = "Bold"; };
          italic = { family = fontname; style = "Light"; };
          size = 14;
        };
      cursor.style = "Block";

      colors = {
        primary = {
          background = "0xf8f8f8";
          foreground = "0x2a2b33";
        };
        normal = {
          black = "0x000000";
          red = "0xde3d35";
          green = "0x3e953a";
          yellow = "0xd2b67b";
          blue = "0x2f5af3";
          magenta = "0xa00095";
          cyan = "0x3e953a";
          white = "0xbbbbbb";
        };
        bright = {
          black = "0x000000";
          red = "0xde3d35";
          green = "0x3e953a";
          yellow = "0xd2b67b";
          blue = "0x2f5af3";
          magenta = "0xa00095";
          cyan = "0x3e953a";
          white = "0xffffff";
        };
      };
    };
  };
}
