{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme
      hashicorp.terraform
      matklad.rust-analyzer
      ms-azuretools.vscode-docker
      vscodevim.vim
      zhuangtongfa.material-theme
    ];
    userSettings = {
      "window.titleBarStyle" = "custom";
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = 0;
      "workbench.colorTheme" = "One Dark Pro";
      "workbench.iconTheme" = "material-icon-theme";
      "editor.fontFamily" = "'JetBrainsMono Nerd Font'";
      "editor.fontSize" = 15;
      "editor.fontWeight" = 500;
      "editor.fontLigatures" = false;
      "editor.letterSpacing" = -0.5;
      "editor.minimap.renderCharacters" = false;
      "editor.minimap.size" = "proportional";
      "editor.minimap.scale" = 2;
      "editor.renderWhitespace" = "none";
      "editor.guides.indentation" = true;
      "editor.tabSize" = 2;
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Fond'";
      "terminal.integrated.fontSize" = 15;
      "terminal.integrated.fontWeight" = "400";
      "terminal.integrated.fontWeightBold" = "400";
      "terminal.integrated.letterSpacing" = 0.5;
    };
  };

  # Reversal icon theme
  xdg.desktopEntries.code = {
    name = "code";
    icon = "vscode";
    exec = "code";
  };
}
