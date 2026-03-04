{ pkgs, ... }:
{
  enable = true;
  settings = {
    theme = "noctalia";
    editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
  };
  languages = {
    language-server.biome = {
      command = "biome";
      args = ["lsp-proxy"];
    };

    language-server.tailwindcss-ls = {
      command = "tailwindcss-language-server";
      args = ["--stdio"];
    };
    
    language-server.ruff = {
      command = "ruff";
      args = ["server"];
    };

    language-server.ty = {
      command = "ty";
      args = ["server"];
      config = {
        inlayHints.callArgumentNames = false;
        experimental.rename = true;
        experimental.autoImport = true;
      };
    };
          
    language = import ./languages.nix { inherit pkgs; };
  };
}
