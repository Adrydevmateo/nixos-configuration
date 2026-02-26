{ pkgs, ... }: [

  {
    name = "html";
    language-servers = [ "vscode-html-language-server" "tailwindcss-ls" { name = "biome"; except-features = ["format"]; } ];
  }
  {
    name = "typescript";
    language-servers = [ "biome" { name = "typescript-language-server"; except-features = [ "format" ]; } ];
    auto-format = true;
  }
  {
    name = "javascript";
    language-servers = [ "biome" { name = "typescript-language-server"; except-features = [ "format" ]; } ];
    auto-format = true;
  }
  {
    name = "tsx";
    language-servers = [ "biome" "tailwindcss-ls" { name = "typescript-language-server"; except-features = [ "format" ]; } ];
    auto-format = true;
  }
  {
    name = "jsx";
    language-servers = [ "biome" "tailwindcss-ls" { name = "typescript-language-server"; except-features = [ "format" ]; } ];
    auto-format = true;
  }  
  {
    name = "css";
    language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
  }
  {
    name = "python";
    language-servers = [ "ty" "ruff"];
    auto-format = true;
  }

]
