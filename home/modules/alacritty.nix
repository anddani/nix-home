{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };

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

      colors = import ./catppuccin-frappe.nix;
    };
  };
}
