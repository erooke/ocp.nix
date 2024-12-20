let
  python-overlay = import ./python/overlay.nix;
in
final: prev: {

  cq-editor = final.callPackage ./cq-editor { };

  lib3mf = final.callPackage ./lib3mf { };

  opencascade-occt = final.pkgs.callPackage ./opencascade-occt {
    enableVtk = true;
    enableRapidJson = true;
  };

  ocp = final.pkgs.callPackage ./OCP {
    vtk = final.python3.pkgs.vtk;
  };

  pythonPackagesExtensions = (prev.pythonPackagesExtensions or [ ]) ++ [
    (final.callPackage python-overlay { })
  ];

  yacv-frontend = final.callPackage ./yacv-frontend { };

}
