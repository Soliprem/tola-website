{
  description = "devFlake for tola-website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    tola = {
      url = "github:kawayww/tola";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, tola, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nushell
            tola.packages.${pkgs.system}.default
            tailwindcss
          ];
          shellHook = ''
            export SHELL=${pkgs.nushell}/bin/nu
            exec nu
          '';
        };
      };
    };
}
