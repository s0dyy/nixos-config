{ pkgs, ... }:

{
  users.users.s0dyy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" ]; 
    shell = pkgs.zsh;
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];
    shells = [ pkgs.zsh ];
  };
}
