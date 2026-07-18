library golden;

import 'dart:js_interop';
import 'package:ngx_dart/angular.dart';

import 'boolean_coerced_inputs.template.dart' as ng;

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
    FancyButtonComponent,
  ],
  template: r'''
    <!-- Implicitly true -->
    <fancy-button raised></fancy-button>
    <fancy-button [raised]></fancy-button>

    <!-- Explicitly true or false -->
    <fancy-button [raised]="value"></fancy-button>
  ''',
)
class GoldenComponent {
  bool value = deopt();
}

@Component(
  selector: 'fancy-button',
  template: '',
)
class FancyButtonComponent {
  @Input()
  set raised(bool raised) => deopt(raised);
}
