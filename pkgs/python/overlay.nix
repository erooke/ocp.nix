{
  casadi,
  llvmPackages_15,
  ocp,
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
  libclang = prev.libclang.override { llvmPackages = llvmPackages_15; };
  nlopt = final.callPackage ./nlopt { };
  ocp = final.callPackage ./ocp { inherit ocp; };
  ocp-tessellate = final.callPackage ./ocp-tessellate { };
  ocpsvg = final.callPackage ./ocpsvg { };
  py-lib3mf = final.callPackage ./py-lib3mf { };
  qtconsole = final.callPackage ./qtconsole { };
  spyder = final.callPackage ./spyder { };
  spyder-kernels = final.callPackage ./spyder-kernels { };
  svgpathtools = final.callPackage ./svgpathtools { };
  trianglesolver = final.callPackage ./trianglesolver { };
  vscode-ocp-cad-viewer = final.callPackage ./vscode-ocp-cad-viewer { };
  yacv-server = final.callPackage ./yacv-server { };
}
