let
  python-overlay = import ./python/overlay.nix;
in
final: prev: {

  lib3mf = final.callPackage ./lib3mf { };

  opencascade-occt = final.pkgs.callPackage ./opencascade-occt {
    enableVtk = true;
    enableRapidJson = true;
  };

  pythonPackagesExtensions = (prev.pythonPackagesExtensions or [ ]) ++ [
    (final.callPackage python-overlay { })
  ];

}
