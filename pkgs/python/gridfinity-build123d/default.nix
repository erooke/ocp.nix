{
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  build123d,
  bd-warehouse,
  pytestCheckHook,
  parameterized,
}:
let
  version = "77f9e8f";
in
buildPythonPackage {
  inherit version;
  pname = "gridfinity-build123d";

  src = fetchFromGitHub {
    owner = "Ruudjhuu";
    repo = "gridfinity_build123d";
    rev = version;
    hash = "sha256-lvZOk5ifCuSsROtdmQU2oHRf3hafpAcBFhPy/nIm/0E=";
  };

  pyproject = true;

  build-system = [
    setuptools
    parameterized
  ];

  dependencies = [
    bd-warehouse
    build123d
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonRelaxDeps = [ "build123d" ];

}
