import 'dart:async';

import 'package:ngx_dart/angular.dart';
import 'package:ngx_test/angular_test.dart';
import 'package:ngx_test/src/errors/will_never_stabilize.dart';
import 'package:test/test.dart';

import 'stabilizer_test.template.dart' as template;

void main() {
  test('should throw error when stabilization threshold is exceeded', () async {
    final testBed = NgTestBed<WillNeverStabilizeComponent>(
        template.createWillNeverStabilizeComponentFactory());
    expect(testBed.create, throwsA(TypeMatcher<WillNeverStabilizeError>()));
  }, skip: 'b/140626607');
}

@Component(
  selector: 'test',
  template: '',
)
class WillNeverStabilizeComponent implements DoCheck {
  @override
  void ngDoCheck() {
    // This creates an infinite change detection loop.
    scheduleMicrotask(() {});
  }
}
