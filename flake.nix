{
  description = "GTK4 hello world";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      nativeBuildInputs = [
        pkgs.cmake
        pkgs.ninja
        pkgs.gcc
        pkgs.pkg-config
      ];

      buildInputs = [
        pkgs.gtk4
      ];
    };
  };
}
