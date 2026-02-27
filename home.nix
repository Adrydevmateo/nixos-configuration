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
    settings = {
      user = {
        name = "AdryDev";
        email = "adrydevmateo@gmail.com";
      };
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
    };
  };

  programs.brave = {
    enable = true;
    package = pkgs.brave;
  };

  programs.claude-code = {
    enable = true;
  };
  
  home.stateVersion = "25.11";
}
