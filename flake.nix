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
        
        rustlings5 = pkgs.rust-bin.stable."1.70.0".default.override {
          extensions = [ "rust-src" "rust-analyzer" ];
        };
        
        # Install rustlings 5.6.1 from crates.io and override exercises
        

      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustlings5
            cargo-watch
          ];

          shellHook = ''
            export PATH="$HOME/.cargo/bin:$PWD/target/release:$PATH"
            
            # Build local rustlings if needed
            if [ ! -f target/release/rustlings ]; then
              echo "Building rustlings v5.6.1 locally..."
              cargo build --release --bin rustlings
            fi

            echo "Rustlings development environment ready!"
            echo "Using local rustlings v5.6.1 with exercise progress preserved."
            echo "Run 'rustlings' to start the exercises."
          '';
        };
      }
    );
}
