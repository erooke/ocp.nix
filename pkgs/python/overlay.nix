{
  llvmPackages_15,
}:
final: prev: {
  libclang = prev.libclang.override { llvmPackages = llvmPackages_15; };
  pywrap = final.callPackage ./pywrap { };
  svgpathtools = final.callPackage ./svgpathtools { };
  trianglesolver = final.callPackage ./trianglesolver { };
}
