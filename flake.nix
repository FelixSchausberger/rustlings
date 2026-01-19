{
  description = "Rustlings exercises development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          extensions = [ "rust-src" "rust-analyzer" ];
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustToolchain
            cargo-watch
          ];

          shellHook = ''
            export PATH="$HOME/.cargo/bin:$PATH"

            RUSTLINGS_VERSION="6.5.0"
            CURRENT_VERSION=$(rustlings --version 2>/dev/null | grep -oP '\d+\.\d+\.\d+' || echo "none")

            if [ "$CURRENT_VERSION" != "$RUSTLINGS_VERSION" ]; then
              echo "Installing rustlings v$RUSTLINGS_VERSION..."
              cargo install rustlings --version $RUSTLINGS_VERSION --locked
            fi

            echo "Rustlings development environment ready!"
            echo "Run 'rustlings' to start the exercises."
          '';
        };
      }
    );
}
