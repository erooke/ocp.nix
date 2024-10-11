{
  lib,
  fetchFromGitHub,
  makeDesktopItem,
  copyDesktopItems,
  python3Packages,
  qt5,
}:
let
  rev = "089bb86";
in
python3Packages.buildPythonApplication {
  pname = "cq-editor";
  version = rev;

  src = fetchFromGitHub {
    owner = "CadQuery";
    repo = "CQ-editor";
    rev = rev;
    hash = "sha256-VYWjOclpH3mfI/6bj4oMKvTj3plAR3mBYTHZE3bkW70=";
  };

  dependencies = with python3Packages; [
    cadquery
    logbook
    nlopt
    pyqt5
    pyparsing
    pyqtgraph
    cq-kit
    cq-warehouse
    spyder
    pathpy
    qtconsole
    requests
  ];

  build-system = with python3Packages; [ setuptools ];

  nativeBuildInputs = [
    copyDesktopItems
    qt5.wrapQtAppsHook
  ];

  # cq-editor crashes when trying to use Wayland, so force xcb
  qtWrapperArgs = [ "--set QT_QPA_PLATFORM xcb" ];

  postFixup = ''
    wrapQtApp "$out/bin/cq-editor"
  '';

  postInstall = ''
    install -Dm644 icons/cadquery_logo_dark.svg $out/share/icons/hicolor/scalable/apps/cadquery.svg

    rm $out/bin/CQ-editor
  '';

  nativeCheckInputs = with python3Packages; [
    pytestCheckHook
    pytest-xvfb
    pytest-mock
    pytestcov
    pytest-repeat
    pytest-qt
  ];

  # requires X server
  doCheck = false;

  desktopItems = [
    (makeDesktopItem {
      name = "com.cadquery.CadQuery";
      desktopName = "CadQuery";
      icon = "cadquery";
      exec = "cq-editor %f";
      categories = [
        "Graphics"
        "3DGraphics"
        "Engineering"
      ];
      type = "Application";
      comment = "CadQuery GUI editor based on PyQT";
    })
  ];

  meta = with lib; {
    description = "CadQuery GUI editor based on PyQT";
    homepage = "https://github.com/CadQuery/CQ-editor";
    license = licenses.asl20;
    maintainers = with maintainers; [
      costrouc
      marcus7070
    ];
  };

}
