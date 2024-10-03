let
  python-overlay = import ./python/overlay.nix;
in
final: prev: {

  lib3mf = final.callPackage ./lib3mf { };

  pythonPackagesExtensions = (prev.pythonPackagesExtensions or [ ]) ++ [ python-overlay ];

}
