import 'package:_tests/compiler.dart';
import 'package:build_test/build_test.dart' show decodedMatches;
import 'package:ngx_compiler/v2/context.dart';
import 'package:test/test.dart';

void main() {
  CompileContext.overrideForTesting();

  test('types native handlers with specific and fallback package:web events',
      () {
    return compilesExpecting(
      '''
        import '$ngImport';

        @Component(
          selector: 'test-component',
          template: r'<button (click)="\$event.preventDefault()"></button>'
              r'<input (change)="\$event.preventDefault()">',
        )
        class TestComponent {}
      ''',
      outputs: {
        'pkg|lib/input.template.dart': decodedMatches(
          allOf(
            contains(
              RegExp(
                r'void _handleEvent_0\(import\d+\.MouseEvent \$event\)',
              ),
            ),
            contains(
              RegExp(
                r'void _handleEvent_1\(import\d+\.Event \$event\)',
              ),
            ),
            contains(
              RegExp(
                r'eventHandler1\(this\._handleEvent_0\) as '
                r'void Function\(import\d+\.MouseEvent\)',
              ),
            ),
            contains(
              RegExp(
                r'eventHandler1\(this\._handleEvent_1\) as '
                r'void Function\(import\d+\.Event\)',
              ),
            ),
          ),
        ),
      },
    );
  });

  test('preserves native event subtype in a complex handler', () {
    return compilesExpecting(
      '''
        import 'package:web/web.dart';
        import '$ngImport';

        @Component(
          selector: 'test-component',
          template: r'<input (keydown)="handleKeyboard(\$event, marker)">',
        )
        class TestComponent {
          final marker = Object();
          void handleKeyboard(KeyboardEvent event, Object marker) {}
        }
      ''',
      outputs: {
        'pkg|lib/input.template.dart': decodedMatches(
          allOf(
            contains(
              RegExp(
                r'void _handleEvent_0\(import\d+\.KeyboardEvent \$event\)',
              ),
            ),
            contains('_ctx.handleKeyboard(\$event, _ctx.marker);'),
            contains(
              RegExp(
                r'eventHandler1\(this\._handleEvent_0\) as '
                r'void Function\(import\d+\.KeyboardEvent\)',
              ),
            ),
          ),
        ),
      },
    );
  });

  test('preserves package:web event payload type from directive output', () {
    return compilesExpecting(
      '''
        import 'dart:async';

        import 'package:web/web.dart';
        import '$ngImport';

        class MouseEventsBase {
          final _events = StreamController<MouseEvent>();

          @Output('renamedMouseEvent')
          Stream<MouseEvent> get mouseEvent => _events.stream;
        }

        @Directive(selector: '[mouseEvents]')
        class MouseEvents extends MouseEventsBase {}

        @Component(
          selector: 'test-component',
          template: '<div mouseEvents '
              r'(renamedMouseEvent)="handleTarget(\$event.target)"></div>',
          directives: [MouseEvents],
        )
        class TestComponent {
          void handleTarget(EventTarget? target) {}
        }
      ''',
      outputs: {
        'pkg|lib/input.template.dart': decodedMatches(
          contains(
            RegExp(
              r'void _handleEvent_0\(import\d+\.MouseEvent \$event\)',
            ),
          ),
        ),
      },
    );
  });

  test('keeps an untyped directive output event dynamic', () {
    return compilesExpecting(
      '''
        import 'dart:async';

        import '$ngImport';

        @Directive(selector: '[untypedEvents]')
        class UntypedEvents {
          @Output()
          Stream get untypedEvent => const Stream.empty();

          @Output()
          Stream<void> get voidEvent => const Stream.empty();
        }

        @Component(
          selector: 'test-component',
          template: '<div untypedEvents '
              r'(untypedEvent)="handleValue(\$event.toString())" '
              r'(voidEvent)="handleValue(\$event.toString())"></div>',
          directives: [UntypedEvents],
        )
        class TestComponent {
          void handleValue(String value) {}
        }
      ''',
      outputs: {
        'pkg|lib/input.template.dart': decodedMatches(
          allOf(
            contains('void _handleEvent_0(dynamic \$event)'),
            contains('void _handleEvent_1(dynamic \$event)'),
            isNot(
              contains(
                RegExp(
                  r'void _handleEvent_0\(import\d+\.Event \$event\)',
                ),
              ),
            ),
          ),
        ),
      },
    );
  });

  test('preserves non-DOM payload type from directive output', () {
    return compilesExpecting(
      '''
        import 'dart:async';

        import '$ngImport';

        class CustomPayload {
          final String value;
          CustomPayload(this.value);
        }

        @Directive(selector: '[customEvents]')
        class CustomEvents {
          final _events = StreamController<CustomPayload>();

          @Output()
          Stream<CustomPayload> get customEvent => _events.stream;
        }

        @Component(
          selector: 'test-component',
          template: '<div customEvents '
              r'(customEvent)="handleValue(\$event.value)"></div>',
          directives: [CustomEvents],
        )
        class TestComponent {
          void handleValue(String value) {}
        }
      ''',
      outputs: {
        'pkg|lib/input.template.dart': decodedMatches(
          contains(
            RegExp(
              r'void _handleEvent_0\(import\d+\.CustomPayload \$event\)',
            ),
          ),
        ),
      },
    );
  });

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
