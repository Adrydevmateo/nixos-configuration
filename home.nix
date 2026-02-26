{ config, pkgs, ... }:
{
  home.username = "adry";
  home.homeDirectory = "/home/adry";

  home.packages = with pkgs; [
    atool
    httpie
    kitty
    gh
    git
  ];

  programs.helix = import ./helix/config.nix { inherit pkgs; };
  
  home.stateVersion = "25.11";
}
