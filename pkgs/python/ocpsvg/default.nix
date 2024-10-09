{
  buildPythonPackage,
  fetchPypi,
  # Buildtime dependencies
  git,
  pytestCheckHook,
  setuptools-scm,
  # Runtime dependencies
  ocp,
  svgpathtools,
  svgelements,
}:
let
  pname = "ocpsvg";
  version = "0.2.1";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-igiSSbUrC/+ZzKlpivPXTvZ4ztI1kxb4wqBK7puq+0Y=";
  };
in
buildPythonPackage {
  inherit src pname version;
  pyproject = true;

  patchPhase = ''
    substituteInPlace pyproject.toml \
      --replace "cadquery-ocp" "ocp"
  '';

  build-system = [
    setuptools-scm
    git
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  dependencies = [
    ocp
    svgpathtools
    svgelements
  ];

}
