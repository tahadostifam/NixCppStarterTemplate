{
  description = "NixCppStarterTemplate";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.simpleFlake {
      inherit nixpkgs;

      packages = perSystem:
        let
          pkgs = nixpkgs.legacyPackages.${perSystem.system};
        in
        {
          defaultPackage = pkgs.stdenv.mkDerivation {
            pname = "nix-cpp-starter-template";
            version = "0.1.0";

            src = ./.;

            nativeBuildInputs = [
              pkgs.cmake
              pkgs.pkg-config
            ];

            buildInputs = [
              pkgs.gcc
            ];

            cmakeFlags = [
              "-DCMAKE_BUILD_TYPE=Release"
            ];
          };

          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              clang
              clang-tools
              stdenv.cc

              glibc
              glibc.dev

              libgcc
              libffi
              libffi.dev

              cmake
              pkg-config
            ];

            shellHook = ''
              export CC=clang
              export CXX=clang++

              export CPATH="${pkgs.glibc.dev}/include:${pkgs.stdenv.cc.cc}/include/c++/${pkgs.stdenv.cc.cc.version}:${pkgs.stdenv.cc.cc}/include/c++/${pkgs.stdenv.cc.cc.version}/x86_64-unknown-linux-gnu"

              export LIBRARY_PATH="${pkgs.glibc.out}/lib:${pkgs.stdenv.cc.cc.lib}/lib:$LIBRARY_PATH"
              export LD_LIBRARY_PATH="${pkgs.glibc.out}/lib:$LD_LIBRARY_PATH"
            '';
          };
        };
    };
}
