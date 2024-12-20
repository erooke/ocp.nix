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
  ocpsvg,
  py-lib3mf,
  scipy,
  svgpathtools,
  trianglesolver,
}:
let
  pname = "build123d";
  version = "0.8.0";
  src = fetchFromGitHub {
    owner = "gumyr";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-yhTMMuYCmrdWbc4+7mUm1m1q6qGqQDn0tN5te/EPQac=";
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
    ocpsvg
    py-lib3mf
    scipy
    svgpathtools
    trianglesolver
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

  pythonRelaxDeps = [ "numpy" ];

}
