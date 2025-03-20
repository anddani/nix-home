{ ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-frappe";
    };
  };

  xdg.configFile = {
    "zellij/layouts/dev.kdl".text = ''
      layout {
          tab {
              pane split_direction="vertical" {
                  filepicker size=40 name="picker"
                  editor
              }
              compact_bar size=1
          }

          swap_tiled_layout name="compact" {
              tab exact_panes=4 {
                  pane split_direction="vertical" {
                      filepicker size=40 name="picker"
                      pane split_direction="horizontal" {
                          editor size="75%"
                          pane
                      }
                  }
                  compact_bar size=1
              }

              tab min_panes=5 {
                  pane split_direction="vertical" {
                      filepicker size=40 name="picker"
                      pane split_direction="horizontal" {
                          editor size="50%"
                          pane split_direction="vertical" {
                              pane
                              pane
                          }
                      }
                  }
                  compact_bar size=1
              }
          }

          swap_tiled_layout name="wide" {
              tab exact_panes=4 {
                  pane split_direction="vertical" {
                      filepicker size=40 name="picker"
                      editor
                      pane split_direction="horizontal" size=80 {
                          pane
                      }
                  }
                  compact_bar size=1
              }

              tab min_panes=5 {
                  pane split_direction="vertical" {
                      filepicker size=40 name="picker"
                      editor
                      pane split_direction="horizontal" size=80 {
                          pane
                          pane
                      }
                  }
                  compact_bar size=1
              }
          }

          // TEMPLATES
          pane_template name="filepicker" {
              command "yazi"
          }

          pane_template name="editor" {
              command "hx"
          }

          pane_template name="compact_bar" {
              borderless true
              plugin location="compact-bar"
          }

          new_tab_template {
              pane
              compact_bar size=1
          }
      }
    '';
  };
}
