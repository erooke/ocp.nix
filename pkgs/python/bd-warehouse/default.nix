{
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools_scm,
  build123d,
  pytestCheckHook,
}:
let
  version = "5142c34";
in
buildPythonPackage {
  pname = "bd-warehouse";
  version = version;

  src = fetchFromGitHub {
    owner = "gumyr";
    repo = "bd_warehouse";
    rev = version;
    hash = "sha256-0xpiGM0GGHGmR38L9YCR5GQuuXwMpj2C8XMHMsoNSyo=";
  };

  pyproject = true;
  build-system = [
    setuptools
    setuptools_scm
  ];
  dependencies = [ build123d ];
  nativeCheckInputs = [ pytestCheckHook ];

  disabledTests = [
    # Broken: gumyr/bd_warehouse/#35
    "TestAcmeThread"
  ];
}
