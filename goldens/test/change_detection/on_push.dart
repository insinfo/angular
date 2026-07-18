import 'dart:js_interop';
import 'package:ngx_dart/angular.dart';

import 'on_push.template.dart' as ng;

/// Avoids Dart2JS thinking something is constant/unchanging.
@JS('deopt')
external ExternalDartReference? _deopt([ExternalDartReference? any]);

T deopt<T>([Object? any]) =>
    _deopt(any?.toExternalReference)?.toDartObject as T;

void main() {
  runApp(ng.createGoldenComponentFactory());
}

@Component(
  selector: 'golden',
  directives: [
    Child,
    ChildWithDoCheck,
  ],
  template: r'''
    <child [name]="name"></child>
    <child-with-do-check [name]="name"></child-with-do-check>
  ''',
  changeDetection: ChangeDetectionStrategy.onPush,
)
class GoldenComponent {
  String name = deopt();
}

@Component(
  selector: 'child',
  template: 'Name: {{name}}',
  changeDetection: ChangeDetectionStrategy.onPush,
)
class Child {
  @Input()
  String? name;
}

@Component(
  selector: 'child-with-do-check',
  template: 'Name: {{name}}',
  changeDetection: ChangeDetectionStrategy.onPush,
)
class ChildWithDoCheck implements DoCheck {
  @Input()
  String? name;

  @override
  void ngDoCheck() {}
}
