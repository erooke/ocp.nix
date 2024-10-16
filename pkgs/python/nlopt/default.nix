{
  lib,
  fetchFromGitHub,
  cmake,
  octave ? null,
  python,
  swig,
  numpy,
  buildPythonPackage,
}:

buildPythonPackage rec {
  pname = "nlopt";
  version = "2.7.1";

  src = fetchFromGitHub {
    owner = "stevengj";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-TgieCX7yUdTAEblzXY/gCN0r6F9TVDh4RdNDjQdXZ1o=";
  };

  format = "other";

  nativeBuildInputs = [
    cmake
    swig
  ];

  buildInputs = [
    octave
    python
  ];

  propagatedBuildInputs = [
    numpy
  ];

  configureFlags =
    [
      "--with-cxx"
      "--enable-shared"
      "--with-pic"
      "--without-guile"
      "--with-python"
      "--without-matlab"
    ]
    ++ lib.optionals (octave != null) [
      "--with-octave"
      "M_INSTALL_DIR=$(out)/${octave.sitePath}/m"
      "OCT_INSTALL_DIR=$(out)/${octave.sitePath}/oct"
    ];

  meta = {
    homepage = "https://nlopt.readthedocs.io/en/latest/";
    description = "Free open-source library for nonlinear optimization";
    license = lib.licenses.lgpl21Plus;
    hydraPlatforms = lib.platforms.linux;
  };

}
