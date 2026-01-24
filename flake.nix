{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay, }:
    let
      overlays = [ rust-overlay.overlays.default ];

      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        inherit overlays;
      };
      pkgsX86 = import nixpkgs {
        system = "x86_64-linux";
        inherit overlays;
      };

      rustToolchainExtensions = [ "rust-src" ];
      rustToolchain = pkgs.rust-bin.nightly.latest.default.override {
        targets = [ "aarch64-apple-darwin" ];
        extensions = rustToolchainExtensions;
      };
      rustToolchainX86 = pkgsX86.rust-bin.nightly.latest.default.override {
        targets = [ "x86_64-unknown-linux-gnu" ];
        extensions = rustToolchainExtensions;
      };

      commonPackages = p: with p; [ nodejs_22 corepack_22 stylua nixfmt taplo ];

    in {
      devShells = {
        aarch64-darwin.default = pkgs.mkShellNoCC {
          packages = [ rustToolchain ] ++ (commonPackages pkgs);
        };
        x86_64-linux.default = pkgsX86.mkShellNoCC {
          packages = [ rustToolchainX86 ] ++ (commonPackages pkgsX86);
        };
      };
    };
}
