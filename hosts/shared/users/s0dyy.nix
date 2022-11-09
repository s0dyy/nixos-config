{ pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.s0dyy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "user-with-access-to-virtualbox" ]; 
    shell = pkgs.zsh;
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];
    shells = [ pkgs.zsh ];
  };
}
