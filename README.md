## AngularDart (ngx_*) — development branch

[![Build Status](https://img.shields.io/github/actions/workflow/status/insinfo/angular/dart.yml?branch=master)](https://github.com/insinfo/angular/actions/workflows/dart.yml)

This repository is a fork of
[angulardart-community/angular](https://github.com/angulardart-community/angular),
maintained by [insinfo](https://github.com/insinfo). It keeps AngularDart
alive under the **`ngx_*`** package family, published on pub.dev.

### What this branch is

`master` is the **development line (9.0.0-dev.\*)**. It continues the
migration started upstream from `dart:html` / `package:js` to the modern
**`package:web`** + `dart:js_interop` stack. Nothing is published from this
branch — releases will come out as `9.0.0-dev.*` versions once the migration
stabilizes.

| Package | Dev version (master) | Stable on pub.dev (from `angular9`) |
|---------|----------------------|--------------------------------------|
| [ngx_dart]     | 9.0.0-dev.1 | [![Pub Package](https://img.shields.io/pub/v/ngx_dart.svg)](https://pub.dev/packages/ngx_dart) |
| [ngx_forms]    | 9.0.0-dev.1 | [![Pub Package](https://img.shields.io/pub/v/ngx_forms.svg)](https://pub.dev/packages/ngx_forms) |
| [ngx_router]   | 9.0.0-dev.1 | [![Pub Package](https://img.shields.io/pub/v/ngx_router.svg)](https://pub.dev/packages/ngx_router) |
| [ngx_test]     | 9.0.0-dev.1 | [![Pub Package](https://img.shields.io/pub/v/ngx_test.svg)](https://pub.dev/packages/ngx_test) |
| [ngx_ast]      | 9.0.0-dev.1 | [![Pub Package](https://img.shields.io/pub/v/ngx_ast.svg)](https://pub.dev/packages/ngx_ast) |
| [ngx_compiler] | 9.0.0-dev.1 | [![Pub Package](https://img.shields.io/pub/v/ngx_compiler.svg)](https://pub.dev/packages/ngx_compiler) |

From `9.0.0-dev.1` on, all packages share a unified version number, mirroring
the versioning of the `@angular/*` packages in Angular TypeScript.

### Branches

- **`master`** (this branch): 9.0.0-dev line — `ngx_*` names + the
  `package:web` / `dart:js_interop` migration. Not published yet.
- [`angular9`](../../tree/angular9): source of the **stable releases**
  published on pub.dev (ngx_dart 8.0.0, ngx_forms 5.0.0, ngx_router 4.0.0,
  ngx_test 5.0.0, ngx_ast 3.0.0, ngx_compiler 3.0.1) — code identical to the
  original pub.dev releases, only renamed. Uses `dart:html`.
- [`angular8`](../../tree/angular8): sources byte-identical to the original
  pub.dev releases under the original names (ngdart 8.0.0-dev.4, ...), for
  apps that keep the old names via git dependency.

### Using the stable packages

```yaml
dependencies:
  ngx_dart: ^8.0.0
  ngx_forms: ^5.0.0
  ngx_router: ^4.0.0

dev_dependencies:
  ngx_test: ^5.0.0
```

Migrating an app from the original names: `ngdart` → `ngx_dart`,
`ngforms` → `ngx_forms`, `ngrouter` → `ngx_router`, `ngtest` → `ngx_test`
in `pubspec.yaml`, and the same substitution in your imports
(`package:ngdart/angular.dart` → `package:ngx_dart/angular.dart`, ...).
The public API is unchanged.

### Documentation site

A static mirror of the AngularDart documentation lives in [`site/`](site/)
and is published at: **https://insinfo.github.io/angular/**

### Roadmap

1. Finish the `package:web` + `dart:js_interop` migration on this branch
   (started upstream in
   [#82](https://github.com/angulardart-community/angular/pull/82)).
2. Release `9.0.0-dev.*` pre-releases of the whole `ngx_*` family.
3. Split `ngx_dart` into smaller packages following the Angular TS layout
   (`ngx_common`, `ngx_web`, `ngx_http`, ...).

### Upstream resources

- Original repository: https://github.com/angulardart-community/angular
- Original documentation site: https://angulardart.xyz
- Original AngularDart project (restricted maintenance):
  https://github.com/angulardart

[ngx_dart]: https://github.com/insinfo/angular/tree/master/ngx_dart
[ngx_forms]: https://github.com/insinfo/angular/tree/master/ngx_forms
[ngx_router]: https://github.com/insinfo/angular/tree/master/ngx_router
[ngx_test]: https://github.com/insinfo/angular/tree/master/ngx_test
[ngx_ast]: https://github.com/insinfo/angular/tree/master/ngx_ast
[ngx_compiler]: https://github.com/insinfo/angular/tree/master/ngx_compiler
