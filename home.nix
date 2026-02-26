{ config, pkgs, ... }:
{
  home.username = "adry";
  home.homeDirectory = "/home/adry";

  home.packages = with pkgs; [
    atool
    httpie
    kitty
  ];

  programs.helix = import ./helix/config.nix { inherit pkgs; };

  programs.git = {
    enable = true;
    userName = "AdryDev";
    userEmail = "adrydevmateo@gmail.com";
  };

  programs.gh = {
    enable = true;
    gitProtocol = "https";
  };
  
  home.stateVersion = "25.11";
}
