{
  pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz") {}
}:

with pkgs;
callPackage ./opencilk {}
