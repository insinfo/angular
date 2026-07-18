## AngularDart — `angular9` branch (ngx_* rename)

[![Build Status](https://img.shields.io/github/actions/workflow/status/insinfo/angular/dart.yml?branch=angular9)](https://github.com/insinfo/angular/actions/workflows/dart.yml)

This repository is a fork of
[angulardart-community/angular](https://github.com/angulardart-community/angular),
maintained by [insinfo](https://github.com/insinfo).

### What this branch is

The `angular9` branch renames the AngularDart packages to the **`ngx_*`
family** so they can be published to pub.dev as stable versions under names
owned by this fork. The naming follows the
[Effective Dart](https://dart.dev/effective-dart/style) conventions and
mirrors the `@angular/*` npm scope of Angular TypeScript
(`@angular/core` → `ngx_core`, `@angular/forms` → `ngx_forms`, ...):

| Original (angular8) | Renamed  | Version | npm counterpart |
|---------------------|----------|---------|-----------------|
| ngdart 8.0.0-dev.4  | [ngx_core]     | 8.0.0 | `@angular/core` (+ common, platform-browser) |
| ngforms 5.0.0-dev.3 | [ngx_forms]    | 5.0.0 | `@angular/forms` |
| ngrouter 4.0.0-dev.3| [ngx_router]   | 4.0.0 | `@angular/router` |
| ngtest 5.0.0-dev.3  | [ngx_test]     | 5.0.0 | `@angular/core/testing` |
| ngast 3.0.0-dev.2   | [ngx_ast]      | 3.0.0 | (template parser) |
| ngcompiler 3.0.0-dev.3 | [ngx_compiler] | 3.0.0 | `@angular/compiler` |

The **code is the same** as the [`angular8`](../../tree/angular8) branch —
which is byte-identical to the versions published on pub.dev — only the
package names, imports and generated-code references changed, and the `-dev`
version suffixes were dropped (these versions have been used in production
for years).

In the future the plan is to split `ngx_core` further, following the Angular
TS package layout (`ngx_common`, `ngx_web`, `ngx_http`, ...).

### Migrating an app from ngdart to ngx_core

1. In `pubspec.yaml`: `ngdart` → `ngx_core`, `ngforms` → `ngx_forms`,
   `ngrouter` → `ngx_router`, `ngtest` → `ngx_test`.
2. In your Dart code, update the imports:
   - `package:ngdart/` → `package:ngx_core/`
   - `package:ngforms/ngforms.dart` → `package:ngx_forms/ngx_forms.dart`
   - `package:ngrouter/ngrouter.dart` → `package:ngx_router/ngx_router.dart`
   - `package:ngtest/angular_test.dart` → `package:ngx_test/angular_test.dart`
3. Rebuild (`dart run build_runner build`). The public API is unchanged.

### Using this branch (git dependency)

```yaml
dependencies:
  ngx_core:
    git:
      url: https://github.com/insinfo/angular.git
      ref: angular9
      path: ngx_core
  ngx_forms:
    git:
      url: https://github.com/insinfo/angular.git
      ref: angular9
      path: ngx_forms
  ngx_router:
    git:
      url: https://github.com/insinfo/angular.git
      ref: angular9
      path: ngx_router

dev_dependencies:
  ngx_test:
    git:
      url: https://github.com/insinfo/angular.git
      ref: angular9
      path: ngx_test
```

### Branches

- [`angular8`](../../tree/angular8): sources byte-identical to the pub.dev
  releases (ngdart 8.0.0-dev.4, ...), for apps that keep the original names.
- **`angular9`** (this branch): the `ngx_*` rename, targeting stable pub.dev
  publishing.

### Documentation site

A static mirror of the AngularDart documentation site is published from the
`angular8` branch at: **https://insinfo.github.io/angular/**

### Upstream resources

- Original repository: https://github.com/angulardart-community/angular
- Original documentation site: https://angulardart.xyz
- Original AngularDart project (restricted maintenance):
  https://github.com/angulardart

[ngx_core]: https://github.com/insinfo/angular/tree/angular9/ngx_core
[ngx_forms]: https://github.com/insinfo/angular/tree/angular9/ngx_forms
[ngx_router]: https://github.com/insinfo/angular/tree/angular9/ngx_router
[ngx_test]: https://github.com/insinfo/angular/tree/angular9/ngx_test
[ngx_ast]: https://github.com/insinfo/angular/tree/angular9/ngx_ast
[ngx_compiler]: https://github.com/insinfo/angular/tree/angular9/ngx_compiler
