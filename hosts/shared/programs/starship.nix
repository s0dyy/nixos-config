{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      character.disabled = true;
      git_branch.style = "red";
      git_state.disabled = true;
      #format = "$username $hostname $directory $git_branch";
      format = "$username $directory $git_branch";
      right_format = "$cmd_duration $time";
      username = {
        disabled = false;
        show_always = true;
        style_user = "green";
        #format = "[$user]($style) @";
      };
      hostname = {
        disabled = true;
        ssh_only = false;
        style = "purple";
        format = "[$ssh_symbol$hostname]($style)";
      };
      directory = {
        truncate_to_repo = false;
        truncation_length = 0;
        style = "yellow";
        #format = "in [$path]($style)[$read_only]($read_only_style)";
      };
      cmd_duration = {
        min_time = 0;
        style = "red";
        format = "took [$duration]($style)";
      };
      time = {
        disabled = false;
      };
    };
  };
}
