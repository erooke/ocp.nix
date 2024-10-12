{
  casadi,
  llvmPackages_15,
  ocp,
}:
final: prev: {
  build123d = final.callPackage ./build123d { };
  cadquery = final.callPackage ./cadquery { };
  casadi = final.toPythonModule (casadi.override { pythonSupport = true; });
  cq-gears = final.callPackage ./cq-gears { };
  cq-kit = final.callPackage ./cq-kit { };
  cq-warehouse = final.callPackage ./cq-warehouse { };
  libclang = prev.libclang.override { llvmPackages = llvmPackages_15; };
  nlopt = final.callPackage ./nlopt { };
  ocp = final.callPackage ./ocp { inherit ocp; };
  ocpsvg = final.callPackage ./ocpsvg { };
  py-lib3mf = final.callPackage ./py-lib3mf { };
  qtconsole = final.callPackage ./qtconsole { };
  spyder = final.callPackage ./spyder { };
  spyder-kernels = final.callPackage ./spyder-kernels { };
  svgpathtools = final.callPackage ./svgpathtools { };
  trianglesolver = final.callPackage ./trianglesolver { };
}
