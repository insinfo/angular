library golden;

import 'dart:js_interop';
import 'package:ngx_dart/angular.dart';

import 'directive_change_detector.template.dart' as ng;

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
    NgModelLike,
  ],
  template: r'''
    <input [(ngModel)]="value" />
  ''',
)
class GoldenComponent {
  String value = deopt();
}

@Directive(
  selector: '[ngModel]:not([ngControl]):not([ngFormControl])',
)
class NgModelLike implements AfterChanges, OnInit {
  @Output('ngModelChange')
  Stream<void> get modelChange => const Stream.empty();

  @Input('ngModel')
  set model(Object ngModel) {}

  @override
  void ngAfterChanges() {}

  @override
  void ngOnInit() {}
}
