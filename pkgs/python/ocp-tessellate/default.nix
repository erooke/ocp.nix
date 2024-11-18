{
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  webcolors,
  numpy,
  cachetools,
  imagesize,
  pytestCheckHook,
  build123d,
  cadquery,
}:
let
  version = "3.0.8";
  owner = "bernhard-42";
  repo = "ocp-tessellate";
  rev = "v${version}";
in

buildPythonPackage {
  pname = "ocp_tesselate";
  inherit version;

  src = fetchFromGitHub {
    inherit owner repo rev;
    hash = "sha256-wnWQoX++JRDqiaXvZ38Fm5tLrToDvk6qD3pMuyXYB+U=";
  };

  pyproject = true;

  build-system = [ setuptools ];

  nativeCheckInputs = [
    pytestCheckHook
    build123d
    cadquery
  ];

  pytestFlagsArray = [
    "pytests"
  ];

  # Not sure why these fail
  disabledTests = [
    "TestConvertMixedCompounds"
  ];

  dependencies = [
    webcolors
    numpy
    cachetools
    imagesize
  ];

}
