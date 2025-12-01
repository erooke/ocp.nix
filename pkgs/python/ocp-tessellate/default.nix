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
  version = "3.1.0";
in

buildPythonPackage {
  pname = "ocp_tesselate";
  inherit version;
  src = fetchzip {
    url = "https://github.com/bernhard-42/ocp-tessellate/releases/download/v3.1.0/ocp_tessellate-3.1.0.tar.gz";
    hash = "sha256-hrzhZN+a/QK9kfK5lHdoX9+RN/vPpnjXn2lrh87uiPE=";
  };

  pyproject = true;

  build-system = [ setuptools ];

  nativeCheckInputs = [
    pytestCheckHook
    build123d
    cadquery
  ];

  pytestFlagsArray = [
    "tests"
  ];

  disabledTests = [
    # These tests cannot locate needed files
    "TestsImageFace"
    # These tests break if webcolors is upgraded
    "test_cq_color"
    "test_cq_color_alpha"
    "test_cq_color_extra_alpha"
  ];

  patchPhase = ''
    substituteInPlace pyproject.toml \
      --replace "cachetools~=5.5.0" "cachetools>=6.0.0"
  '';

  dependencies = [
    webcolors
    numpy
    cachetools
    imagesize
  ];

  pythonRelaxDeps = [ "webcolors" ];
}
