{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  more-itertools,
  wslink,
  nox,
  pre-commit,
  pytest,
  pytest-asyncio,
  ruff,
}:

buildPythonPackage rec {
  pname = "trame-server";
  version = "3.8.1";
  pyproject = true;

  src = fetchPypi {
    pname = "trame_server";
    inherit version;
    hash = "sha256-iKKrGNSGZN+QPy7yyTc0uWqg/1EXC5OqOyGL6AtwUpo=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    more-itertools
    wslink
  ];

  optional-dependencies = {
    dev = [
      nox
      pre-commit
      pytest
      pytest-asyncio
      ruff
    ];
  };

  pythonImportsCheck = [
    "trame_server"
  ];

  meta = {
    description = "Internal server side implementation of trame";
    homepage = "https://pypi.org/project/trame-server/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
