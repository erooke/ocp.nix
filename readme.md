# ocp.nix

Nix expressions to build [OCP](https://github.com/CadQuery/OCP) and related projects.
Inspired by [vinszent/cq-flake](https://github.com/vinszent/cq-flake).

## Pardon the dust

OCP and CadQuery build; albeit with a couple failing tests. Cleaning up a
couple of things and adding docs are next on the docket.

## Goals

### Make it trivial to start + run an OCP based project with nix

A nix user should be able to run a single command to get a working environment
to play with CadQuery and its ilk. This environment should be robust, others
should be able to run the project well into the future.

### Upstream changes

In the course of packaging CadQuery and friends new nix expressions have been
written, some have been patched. Wherever this makes sense these changes
should be upstream-ed to nixpkgs. Similarly any issues with or improvements to
the OCP build pipeline should be reported upstream. Ideally I should be able to
delete this repository some day.

## Contributing

I don't know what I'm doing. If you see something which you think could be done
better or want to contribute a package feel free to open a PR. Especially if
you know how to solve any of the [help
wanted](https://github.com/erooke/ocp.nix/labels/help%20wanted) issues.
