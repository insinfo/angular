<!-- Badges -->

[![Pub Package](https://img.shields.io/pub/v/ngx_dart.svg)](https://pub.dev/packages/ngx_dart)
[![Build Status](https://img.shields.io/github/actions/workflow/status/insinfo/angular/dart.yml?branch=master)](https://github.com/insinfo/angular/actions/workflows/dart.yml)

[AngularDart][docs] is an open-source web framework focused on productivity,
performance, and stability. Originally developed by Google, AngularDart has
powered sophisticated, mission-critical apps that serve millions of users. It
is built on [Dart](https://dart.dev/web) and has been used extensively in
production, including but not limited to Google AdWords, Google Fiber, Wrike,
etc.

`ngx_dart` is the continuation of the original `angular`/`ngdart` package,
maintained by the [insinfo/angular][repo] fork under the `ngx_*` family
(`ngx_dart`, [ngx_forms], [ngx_router], [ngx_test]).

**Disclaimer**: This is not a Google product in any way, official or
unofficial.

## Migrating from ngdart?

The public API is unchanged — only the package name differs:

1. In `pubspec.yaml`: `ngdart: 8.0.0-dev.4` → `ngx_dart: ^8.0.0`.
2. In your imports: `package:ngdart/` → `package:ngx_dart/`.
3. Rebuild with `dart run build_runner build`.

See the [migration guide][migration] for details, including how to prepare
for the upcoming 9.x releases based on `package:web`.

## New to AngularDart?

* Go to [Get Started][get_started] for a quick introduction to creating and
  running AngularDart web apps.
* Follow the [AngularDart tutorial][tutorial] to build a fully working
  application that includes routing, HTTP networking, and more.

## Resources

* Documentation site: [insinfo.github.io/angular][docs]
* Source code and issues: [github.com/insinfo/angular][repo]
* Companion packages: [ngx_forms], [ngx_router], [ngx_test],
  [ngx_compiler](https://pub.dev/packages/ngx_compiler),
  [ngx_ast](https://pub.dev/packages/ngx_ast)

[docs]: https://insinfo.github.io/angular/
[repo]: https://github.com/insinfo/angular
[migration]: https://insinfo.github.io/angular/migration
[get_started]: https://insinfo.github.io/angular/guide/setup
[tutorial]: https://insinfo.github.io/angular/tutorial
[ngx_forms]: https://pub.dev/packages/ngx_forms
[ngx_router]: https://pub.dev/packages/ngx_router
[ngx_test]: https://pub.dev/packages/ngx_test
