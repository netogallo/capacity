{ repoRoot, inputs, pkgs, lib, system }:

cabalProject:

let
  capacity-app = cabalProject.hsPkgs.capacity-app.components.exes.capacity-app;
in

{
  name = "capacity-app";

  packages = [
    capacity-app
    pkgs.qt5Full
  ];

  env = {
  };
}
