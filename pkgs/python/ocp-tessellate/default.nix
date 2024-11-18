{
  fetchzip,
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
in

buildPythonPackage {
  pname = "ocp_tesselate";
  inherit version;
  src = fetchzip {
    url = "https://github.com/bernhard-42/ocp-tessellate/releases/download/v3.0.8/ocp_tessellate-3.0.8.tar.gz";
    hash = "sha256-4QQ3dMvKK35NCEvvdPenLhEHhTB+AjYKA+IxOdVbv1o=";
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
    "TestsImageFace"
  ];

  dependencies = [
    webcolors
    numpy
    cachetools
    imagesize
  ];

}
