{ config, pkgs, ... }:
{
  home.username = "adry";
  home.homeDirectory = "/home/adry";

  home.packages = with pkgs; [
    httpie
    kitty
    unzip
    vscode
    lsof
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

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    package = pkgs.zellij;
    settings = {
      default_layout = "compact";
      default_mode = "locked";
      ui.pane_frames.hide_session_name = true;
      theme = "catppuccin-macchiato";
    };
  };
  
  home.stateVersion = "25.11";
}
