{
  description = "NixCppStarterTemplate";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "nix-cpp-starter-template";
          version = "0.1.0";

          src = ./.;

          nativeBuildInputs = [
            pkgs.cmake
            pkgs.pkg-config
          ];

          buildInputs = [
            pkgs.clang
          ];

          cmakeFlags = [
            "-DCMAKE_BUILD_TYPE=Release"
          ];
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            clang
            clang-tools
            cmake
            pkg-config
            glibc
            glibc.dev
          ];

          shellHook = ''
            export CC=clang
            export CXX=clang++

            export CXX_INCLUDE_PATH="${pkgs.glibc.dev}/include:${pkgs.clang}/resource-root/include"

            export LIBRARY_PATH="${pkgs.glibc.out}/lib:$LIBRARY_PATH"
            export LD_LIBRARY_PATH="${pkgs.glibc.out}/lib:$LD_LIBRARY_PATH"

            export CMAKE_EXPORT_COMPILE_COMMANDS=ON

            echo "Clang C/C++ dev environment ready."
          '';
        };
      });
}
