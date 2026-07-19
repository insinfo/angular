import 'package:_tests/compiler.dart';
import 'package:build_test/build_test.dart' show decodedMatches;
import 'package:ngx_compiler/v2/context.dart';
import 'package:test/test.dart';

void main() {
  CompileContext.overrideForTesting();

  test('keeps detached template roots statically typed for package:web', () {
    return compilesExpecting(
      '''
        import '$ngImport';

        @Component(
          selector: 'test-component',
          template: '<div *ngIf="show">{{label}}</div>',
          directives: [NgIf],
        )
        class TestComponent {
          bool show = true;
          String label = 'value';
        }
      ''',
      outputs: {
        'pkg|lib/input.template.dart': decodedMatches(
          allOf(
            contains(
              RegExp(
                r'unsafeCast<import\d+\.HTMLDivElement>\(\s*'
                r"doc\.createElement\('div'\),?\s*\)",
              ),
            ),
            isNot(
              contains(
                RegExp(r"unsafeCast\(doc\.createElement\('div'\)\)"),
              ),
            ),
          ),
        ),
      },
    );
  });
}
