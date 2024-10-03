let
  python-overlay = import ./python/overlay.nix;
in
_: prev: {

  pythonPackagesExtensions = (prev.pythonPackagesExtensions or [ ]) ++ [ python-overlay ];

}
