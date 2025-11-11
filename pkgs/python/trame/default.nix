{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  pyyaml,
  trame-client,
  trame-common,
  trame-server,
  wslink,
  pywebview,
  pre-commit,
  pytest,
  ruff,
  jupyterlab,
}:

buildPythonPackage rec {
  pname = "trame";
  version = "3.12.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iLhhFiy4sCXoTpPxfc/UOoTQLSwWCMn21Y481kalDAU=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    pyyaml
    trame-client
    trame-common
    trame-server
    wslink
  ];

  optional-dependencies = {
    app = [
      pywebview
    ];
    dev = [
      pre-commit
      pytest
      ruff
    ];
    jupyter = [
      jupyterlab
    ];
  };

  pythonImportsCheck = [
    "trame"
  ];

  meta = {
    description = "Trame, a framework to build applications in plain Python";
    homepage = "https://pypi.org/project/trame/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
