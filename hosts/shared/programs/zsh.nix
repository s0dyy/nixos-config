{
  programs.zsh = {
    enable = true;
    localVariables = { 
      EDITOR="vim"; 
      TERM="xterm-256color"; 
      FZF_DEFAULT_OPTS="
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8";
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
      mpc="cd $HOME/Documents/mpc";
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
      debian="machinectl login debian";
    };
  };
}
