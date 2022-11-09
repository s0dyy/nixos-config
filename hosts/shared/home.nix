{ config, pkgs, ... }:

{
  imports = [
    ./programs/alacritty.nix
    ./programs/bat.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/slack.nix
    ./programs/spotify.nix
    ./programs/starship.nix
    ./programs/vscode.nix
    ./programs/zsh.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "22.11";
}
