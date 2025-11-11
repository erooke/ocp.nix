{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  nox,
  pre-commit,
  pytest,
  pytest-cov,
  ruff,
}:

buildPythonPackage rec {
  pname = "trame-common";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "trame_common";
    inherit version;
    hash = "sha256-nUry2abQinQFl39FmTHKudS1OuEgqAJkVF9nnR+alLw=";
  };

  build-system = [
    hatchling
  ];

  optional-dependencies = {
    dev = [
      nox
      pre-commit
      pytest
      pytest-cov
      ruff
    ];
    test = [
      nox
      pytest
      pytest-cov
    ];
  };

  pythonImportsCheck = [
    "trame_common"
  ];

  meta = {
    description = "Dependency less classes and functions for trame";
    homepage = "https://pypi.org/project/trame-common/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
