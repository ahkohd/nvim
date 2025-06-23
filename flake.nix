{
  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        packages = with pkgs; [
          nodejs_24

          corepack_24
        ];

      in {

        devShells.default = pkgs.mkShell {
          buildInputs = packages;

          shellHook = ''
            echo "🔮 Welcome to ahkohd/nvim development environment!"
          '';
        };
      });
}

