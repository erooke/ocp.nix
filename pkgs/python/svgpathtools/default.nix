{
  buildPythonPackage,
  fetchPypi,
  pytestCheckHook,
  numpy,
  scipy,
  svgwrite,
  setuptools,
}:
let
  pname = "svgpathtools";
  version = "1.6.1";
  src = fetchPypi {
    inherit version pname;
    hash = "sha256-cFTm3hlT4pW/Vl1TXVhWlUU7CfjbSi98SFM0hzIJej4=";
  };
in
buildPythonPackage {
  inherit src pname version;
  pyproject = true;

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  dependencies = [
    numpy
    scipy
    svgwrite
  ];
}
