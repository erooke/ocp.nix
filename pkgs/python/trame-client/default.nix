{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  trame-common,
  pre-commit,
  ruff,
  pillow,
  pixelmatch,
  pytest,
  pytest-playwright,
  pytest-xprocess,
}:

buildPythonPackage rec {
  pname = "trame-client";
  version = "3.11.2";
  pyproject = true;

  src = fetchPypi {
    pname = "trame_client";
    inherit version;
    hash = "sha256-mLPwnQ+9sJzSnqxhyUWnbcrUoIz7SEOrzloUj9b8cxY=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    trame-common
  ];

  optional-dependencies = {
    dev = [
      pre-commit
      ruff
    ];
    test = [
      pillow
      pixelmatch
      pytest
      pytest-playwright
      pytest-xprocess
    ];
  };

  pythonImportsCheck = [
    "trame_client"
  ];

  meta = {
    description = "Internal client of trame";
    homepage = "https://pypi.org/project/trame-client/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
