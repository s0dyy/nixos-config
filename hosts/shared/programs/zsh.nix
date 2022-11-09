{
  programs.zsh = {
    enable = true;
    localVariables = { 
      EDITOR="vim"; 
      TERM="xterm-256color"; 
    };
    initExtraBeforeCompInit = ''
      if [[ -z "$ZELLIJ" ]]; then
        if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
          zellij --layout compact options --no-pane-frames attach -c
          #zellij options --no-pane-frames attach -c
        else
          zellij --layout compact options --no-pane-frames
          #zellij options --no-pane-frames
        fi

        if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
          exit
        fi
      fi

      function chpwd() {
        exa -lagF --git --sort type --time-style iso --icons
      }
    '';
    shellAliases = {
      doc="cd $HOME/Documents";
      dow="cd $HOME/Downloads";
      gh="cd $HOME/Documents/github";
      gl="cd $HOME/Documents/gitlab";
      glc="cd $HOME/Documents/gitlab-clevercloud";
      gle="cd $HOME/Documents/gitlab-exherbo";
      hm="cd $HOME/Documents/github/s0dyy/nix-config";
      config="cd $HOME/Documents/github/s0dyy/nix-config";
      ll1="exa -a1F --sort type --icons";
      ll1t="exa -a1TF --sort type --icons";
      ll="exa -lgF --sort type --time-style iso --icons";
      lla="exa -lagF --sort type --time-style iso --icons";
      llag="exa -lagF --git --sort type --time-style iso --icons";
      llat="exa -lagTF --sort type --time-style iso --icons";
      cat="bat";
      rr="su -";
      cc="clear";
      fd="fd -H -i -L";
      zz="source $HOME/.zshrc";
      exherbo="machinectl login exherbo";
    };
  };
}
