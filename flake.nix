{
  description = "OCP Ecosystem packaged for nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      overlay = import ./pkgs/overlay.nix;
      pkgs = nixpkgs.legacyPackages.${system}.extend overlay;
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;

      overlays.default = overlay;

      packages.${system}.default = pkgs.python3.withPackages (ps: [ ps.ocp ]);

      checks.${system} = {
        deadcode =
          pkgs.runCommandLocal "fmt-check"
            {
              src = ./.;
              nativeBuildInputs = [ pkgs.deadnix ];
            }
            ''
              deadnix --fail $src && touch $out
            '';

        fmt =
          pkgs.runCommandLocal "fmt"
            {
              src = ./.;
              nativeBuildInputs = [ pkgs.nixfmt-rfc-style ];
            }
            ''
              nixfmt -c "$src" && touch $out
            '';

      };
    };
}
