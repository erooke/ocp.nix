{
  fetchFromGitHub,
  buildPythonPackage,
  # Build system
  setuptools,
  # Deps
  click,
  jinja2,
  joblib,
  libclang,
  logzero,
  pandas,
  path,
  pybind11,
  pyparsing,
  schema,
  toml,
  toposort,
  tqdm,
}:
let
  pname = "pywrap";
  version = "6cbeb64";
in
buildPythonPackage {
  inherit pname version;
  src = fetchFromGitHub {
    owner = "CadQuery";
    repo = pname;
    rev = version;
    hash = "sha256-2uamlqYflZ3nuiaWVcZCwgwoLy7dLN7FXJWAijuNq3A=";
  };

  pyproject = true;

  build-system = [ setuptools ];

  dependencies = [
    click
    jinja2
    joblib
    libclang
    logzero
    pandas
    path
    pybind11
    pyparsing
    schema
    toml
    toposort
    tqdm
  ];

  pythonImportsCheck = [ "bindgen" ];
}
