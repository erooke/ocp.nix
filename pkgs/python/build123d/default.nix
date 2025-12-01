{
  buildPythonPackage,
  fetchFromGitHub,
  # Buildtime dependencies
  git,
  pytestCheckHook,
  setuptools-scm,
  # Runtime dependencies
  anytree,
  ezdxf,
  ipython,
  numpy,
  ocp,
  ocp-gordon,
  ocpsvg,
  py-lib3mf,
  scipy,
  svgpathtools,
  sympy,
  trianglesolver,
  webcolors,
}:
let
  pname = "build123d";
  version = "0.10.0";
  src = fetchFromGitHub {
    owner = "gumyr";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-EhV6/ZTBp9XxWY1CgNKESikgTnAk9xaF0g/bYEQPf20=";
  };
in
buildPythonPackage {
  inherit src pname version;
  pyproject = true;

  patchPhase = ''
    substituteInPlace pyproject.toml \
      --replace "cadquery-ocp" "ocp"
  '';

  nativeBuildInputs = [
    git
    pytestCheckHook
    setuptools-scm
  ];

  propagatedBuildInputs = [
    anytree
    ezdxf
    ipython
    numpy
    ocp
    ocp-gordon
    ocpsvg
    py-lib3mf
    scipy
    svgpathtools
    sympy
    trianglesolver
    webcolors
  ];

  disabledTests = [
    # These attempt to access the network
    "test_assembly_with_oriented_parts"
    "test_move_single_object"
    "test_single_label_color"
    "test_single_object"
    # Overly strict test
    "test_version"
  ];

  pythonRelaxDeps = [ "webcolors"];

}
