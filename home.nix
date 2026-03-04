{ config, pkgs, ... }:
{
  home.username = "adry";
  home.homeDirectory = "/home/adry";

  home.packages = with pkgs; [
    httpie
    kitty
    unzip
    nodejs_24
    biome
    nodePackages.pnpm
    nodePackages.tailwindcss
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
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

  programs.vscode = {
    enable = true;
  };
  
  home.stateVersion = "25.11";
}
