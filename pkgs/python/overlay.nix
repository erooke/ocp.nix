{
  casadi,
  ocp,
  fetchFromGitHub,
}:
final: prev: {
  bd-warehouse = final.callPackage ./bd-warehouse { };
  build123d = final.callPackage ./build123d { };
  cadquery = final.callPackage ./cadquery { };
  casadi = final.toPythonModule (casadi.override { pythonSupport = true; });
  cq-gridfinity = final.callPackage ./cq-gridfinity { };
  cq-kit = final.callPackage ./cq-kit { };
  cq-warehouse = final.callPackage ./cq-warehouse { };
  gridfinity-build123d = final.callPackage ./gridfinity-build123d { };
  multimethod = prev.multimethod.overrideAttrs (old: {
    version = "1.12.0";
    src = fetchFromGitHub {
      owner = "coady";
      repo = old.pname;
      tag = "v1.12";
      hash = "sha256-ToiE/0pxBFpgeXxePlmqRpZ8jVPz796kyR7Jdy0R3XI=";
    };
  });
  ocp = final.callPackage ./ocp { inherit ocp; };
  ocp-tessellate = final.callPackage ./ocp-tessellate { };
  ocpsvg = final.callPackage ./ocpsvg { };
  py-lib3mf = final.callPackage ./py-lib3mf { };
  qtconsole = final.callPackage ./qtconsole { };
  spyder = final.callPackage ./spyder { };
  spyder-kernels = final.callPackage ./spyder-kernels { };
  svgpathtools = final.callPackage ./svgpathtools { };
  trame = final.callPackage ./trame { };
  trame-client = final.callPackage ./trame-client {};
  trame-common = final.callPackage ./trame-common {};
  trame-server = final.callPackage ./trame-server {};
  trame-vtk = final.callPackage ./trame-vtk { };
  trianglesolver = final.callPackage ./trianglesolver { };
  vscode-ocp-cad-viewer = final.callPackage ./vscode-ocp-cad-viewer { };
  yacv-server = final.callPackage ./yacv-server { };
}
