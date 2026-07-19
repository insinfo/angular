import 'package:ngx_compiler/v1/src/compiler/identifiers.dart';
import 'package:ngx_compiler/v2/context.dart';
import 'package:test/test.dart';

import '../../resolve_util.dart';

void main() {
  setUp(() {
    CompileContext.overrideForTesting(CompileContext.forTesting());
  });

  group('Generic type parameter', () {
    test('should resolve to dynamic when unspecified', () async {
      final normalizedComponent = await resolveAndFindComponent('''
        @Component(selector: 'not-blank')
        class TestComponent<T> {
          @Input()
          T value;
        }''');
      expect(
          normalizedComponent.component.inputTypes['value']?.name, 'dynamic');
    });

    test('should resolve to dynamic when unspecified on supertype', () async {
      final normalizedComponent = await resolveAndFindComponent('''
        abstract class Base<T> {
          @Input()
          T value;
        }

        @Component(selector: 'not-blank')
        class TestComponent extends Base {}
      ''');
      expect(
          normalizedComponent.component.inputTypes['value']?.name, 'dynamic');
    });

    test('should resolve bounded type', () async {
      final normalizedComponent = await resolveAndFindComponent('''
        @Component(selector: 'not-blank')
        class TestComponent<T extends String> {
          @Input()
          T value;
        }''');
      expect(normalizedComponent.component.inputTypes['value']?.name, 'String');
    });

    test('should resolve bounded type on supertype', () async {
      final normalizedComponent = await resolveAndFindComponent('''
        abstract class Base<T> {
          @Input()
          T value;
        }

        @Component(selector: 'not-blank')
        class TestComponent<S extends String> extends Base<S> {}
      ''');
      expect(normalizedComponent.component.inputTypes['value']?.name, 'String');
    });

    test('should resolve to specified type', () async {
      final normalizedComponent = await resolveAndFindComponent('''
        abstract class Base<T> {
          @Input()
          T value;
        }

        @Component(selector: 'not-blank')
        class TestComponent extends Base<String> {}
      ''');
      expect(normalizedComponent.component.inputTypes['value']?.name, 'String');
    });
  });

  group('Constructor dependency tokens', () {
    test('canonicalizes a typedef of package:web HTMLElement', () async {
      final normalizedComponent = await resolveAndFindComponent('''
        import 'package:web/web.dart' as web;

        typedef HtmlElement = web.HTMLElement;

        @Component(selector: 'test-component')
        class TestComponent {
          TestComponent(HtmlElement element);
        }
      ''');

      final token = normalizedComponent.component.type.diDeps.single.token!;
      expect(token.equalsTo(Identifiers.htmlElementToken), isTrue);
    });

    test('canonicalizes a typedef of package:web Element', () async {
      final normalizedComponent = await resolveAndFindComponent('''
        import 'package:web/web.dart' as web;

        typedef DomElement = web.Element;

        @Component(selector: 'test-component')
        class TestComponent {
          TestComponent(DomElement element);
        }
      ''');

      final token = normalizedComponent.component.type.diDeps.single.token!;
      expect(token.equalsTo(Identifiers.elementToken), isTrue);
    });
  });
}
