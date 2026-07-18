## AngularDart — `angular8` branch (fork)

[![Build Status](https://img.shields.io/github/actions/workflow/status/insinfo/angular/dart.yml?branch=angular8)](https://github.com/insinfo/angular/actions/workflows/dart.yml)

This repository is a fork of
[angulardart-community/angular](https://github.com/angulardart-community/angular),
maintained by [insinfo](https://github.com/insinfo).

### What this branch is

The `angular8` branch is **faithful to the code published on pub.dev**: the
source of each package below is byte-identical to the corresponding version
published on pub.dev (verified by hash). Its purpose is to keep existing
applications that depend on these exact versions working, buildable and
testable, even though the upstream project appears to be unmaintained.

| Package      | Version pinned on this branch                                             |
|--------------|----------------------------------------------------------------------------|
| [ngdart]     | [8.0.0-dev.4](https://pub.dev/packages/ngdart/versions/8.0.0-dev.4)        |
| [ngforms]    | [5.0.0-dev.3](https://pub.dev/packages/ngforms/versions/5.0.0-dev.3)       |
| [ngrouter]   | [4.0.0-dev.3](https://pub.dev/packages/ngrouter/versions/4.0.0-dev.3)      |
| [ngtest]     | [5.0.0-dev.3](https://pub.dev/packages/ngtest/versions/5.0.0-dev.3)        |
| [ngast]      | [3.0.0-dev.2](https://pub.dev/packages/ngast/versions/3.0.0-dev.2)         |
| [ngcompiler] | [3.0.0-dev.3](https://pub.dev/packages/ngcompiler/versions/3.0.0-dev.3)    |

Only repository infrastructure (workspace resolution, test suites, CI) was
adapted so everything runs on Dart >= 3.6; the `lib/` source of the packages
is untouched.

### Using this branch (git dependency)

This branch will be kept alive so it can be consumed directly from git:

```yaml
dependencies:
  ngdart:
    git:
      url: https://github.com/insinfo/angular.git
      ref: angular8
      path: ngdart
  ngforms:
    git:
      url: https://github.com/insinfo/angular.git
      ref: angular8
      path: ngforms
  ngrouter:
    git:
      url: https://github.com/insinfo/angular.git
      ref: angular8
      path: ngrouter

dev_dependencies:
  ngtest:
    git:
      url: https://github.com/insinfo/angular.git
      ref: angular8
      path: ngtest
```

### Roadmap

- **This branch (`angular8`)**: stays identical to the pub.dev releases, for
  use via git dependency. No breaking changes.
- **Rename branch (planned)**: since the original package names are owned by
  the upstream publisher, publishing stable versions (e.g. `8.0.0` without the
  `-dev` suffix) to pub.dev requires renaming the packages. That work will
  happen in a separate branch, keeping this one untouched.

### Documentation site

A static mirror of the AngularDart documentation site (guide, tutorial,
codelabs, cheat sheet, ...) lives in [`site/`](site/) and is
published with GitHub Pages at:

**https://insinfo.github.io/angular/**

The deploy is automated by
[`.github/workflows/pages.yml`](.github/workflows/pages.yml) whenever
`site/` changes on this branch.

### Upstream resources

- Original repository: https://github.com/angulardart-community/angular
- Original documentation site: https://angulardart.xyz
- Original AngularDart project (restricted maintenance):
  https://github.com/angulardart

[ngdart]: https://github.com/insinfo/angular/tree/angular8/ngdart
[ngforms]: https://github.com/insinfo/angular/tree/angular8/ngforms
[ngrouter]: https://github.com/insinfo/angular/tree/angular8/ngrouter
[ngtest]: https://github.com/insinfo/angular/tree/angular8/ngtest
[ngast]: https://github.com/insinfo/angular/tree/angular8/ngast
[ngcompiler]: https://github.com/insinfo/angular/tree/angular8/ngcompiler
