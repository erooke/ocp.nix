{
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  cadquery,
  numpy,
  pytestCheckHook,
}:
let
  rev = "b621d97";
in
buildPythonPackage {
  pname = "cq-gears";
  version = rev;

  src = fetchFromGitHub {
    inherit rev;
    owner = "meadiode";
    repo = "cq_gears";
    hash = "sha256-d5GoRZH5PSYDFGVobuuKESk3XKqf5ty/SxbxWy0x8JQ=";
  };

  pyproject = true;

  build-system = [ setuptools ];

  dependencies = [
    cadquery
    numpy
  ];

  # TODO: the tests fail due to some basic module importing failure...
  doCheck = false;

  nativeCheckInputs = [ pytestCheckHook ];
}
