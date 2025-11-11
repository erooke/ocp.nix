{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  trame-client,
  coverage,
  nox,
  pre-commit,
  pytest,
  pytest-asyncio,
  ruff,
}:

buildPythonPackage rec {
  pname = "trame-vtk";
  version = "2.10.0";
  pyproject = true;

  src = fetchPypi {
    pname = "trame_vtk";
    inherit version;
    hash = "sha256-Dkyr14wei2fahXulw6QEohlcs+hJolK65RV1KRvvAa0=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    trame-client
  ];

  optional-dependencies = {
    dev = [
      coverage
      nox
      pre-commit
      pytest
      pytest-asyncio
      ruff
    ];
  };

  pythonImportsCheck = [
    "trame_vtk"
  ];

  meta = {
    description = "VTK widgets for trame";
    homepage = "https://pypi.org/project/trame-vtk/";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
  };
}
