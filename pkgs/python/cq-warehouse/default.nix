{
  fetchFromGitHub,
  buildPythonPackage,
  pytestCheckHook,
  setuptools,
  cadquery,
}:
let
  rev = "daa4650";
in
buildPythonPackage {
  pname = "cq-warehouse";
  version = rev;

  src = fetchFromGitHub {
    owner = "gumyr";
    repo = "cq_warehouse";
    rev = rev;
    hash = "sha256-1wsYbjPzC9BGEDM9YZcAsnIGMc3fom75bp+LgZ/rqJw=";
  };

  pyproject = true;

  build-system = [ setuptools ];

  dependencies = [
    cadquery
  ];

  patches = [
    ./pyproject.patch
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  disabledTests = [
    "test_five_sprocket_chain"
    "test_missing_link"
    "test_oblique_plane"
    "test_assemble_chain_transmission"
    "test_make_link"
  ];

}
