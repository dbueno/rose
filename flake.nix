{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, flake-compat }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        rose = pkgs.callPackage ./nix/rose.nix {};
      in {
        packages = {
          inherit rose;
        };
        defaultPackage = pkgs.hello;
        devShell =
          pkgs.mkShell {
            inputsFrom = [ rose ];
            hardeningDisable = [ "all" ];
          };
      });
}


