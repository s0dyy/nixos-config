{ config, pkgs, inputs, ... }:

#let
  #unstable = import inputs.unstable {
    #system = pkgs.system;
    ## Uncomment this if you need an unfree package from unstable.
    ##config.allowUnfree = true;
  #};
#in

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.decorations = "none";
      #window.opacity = 0.9;
      window.opacity = 1;
      scrolling.history = 10000;
      font.normal = {
        family = "Jet Brains Mono Nerd Font";
        style = "Medium";
      };
      font.bold = {
        family = "Jet Brains Mono Nerd Font";
        style = "Medium";
      };
      font.italic = {
        family = "Jet Brains Mono Nerd Font";
        style = "Medium";
      };
      font.bold_italic = {
        family = "Jet Brains Mono Nerd Font";
        style = "Medium";
      };
      font.size = 11;
      font.offset = {
        x = -2;
        y = 0;
      };
      # catpupuccin
      colors = {
        primary = {
          background = "#1E1E2E"; # base
          foreground = "#CDD6F4"; # text
          dim_foreground = "#CDD6F4"; # text
          bright_foreground = "#CDD6F4"; # text
        };
        search = {
          matches = {
              foreground = "#1E1E2E"; # base
              background = "#A6ADC8"; # subtext0
          };
          focused_match = {
              foreground = "#1E1E2E"; # base
              background = "#A6E3A1"; # green
          };
          footer_bar = {
              foreground = "#1E1E2E"; # base
              background = "#A6ADC8"; # subtext0
          };
        };
        hints = {
          start = {
            foreground = "#1E1E2E"; # base
            background = "#F9E2AF"; # yellow
          };
          end = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };
        };
        selection = { 
          text = "#1E1E2E"; # base
          background ="#F5E0DC"; # rosewater
        };
        normal = {
          black = "#45475A"; # surface1
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#BAC2DE"; # subtext1
        };
        bright = {
          black = "#585B70"; # surface2
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#A6ADC8"; # subtext0
        };
        dim = {
          black = "#45475A"; # surface1
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#BAC2DE"; # subtext1
        };
      };
    };
  };
}
