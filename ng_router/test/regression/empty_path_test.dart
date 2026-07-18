import 'package:ng_core/angular.dart';
import 'package:ng_router/ng_router.dart';
import 'package:ng_router/testing.dart';
import 'package:ng_test/angular_test.dart';
import 'package:test/test.dart';

// ignore: uri_has_not_been_generated
import 'empty_path_test.template.dart' as ng;

void main() {
  tearDown(disposeAnyRunningTest);

  test('navigation to empty path should fail', () async {
    final testBed = NgTestBed<TestComponent>(ng.createTestComponentFactory());
    final testFixture = await testBed.create();
    final router = testFixture.assertOnlyInstance.router;
    final result = await router.navigate('/');
    expect(result, NavigationResult.invalidRoute);
  });
}

@Component(
  selector: 'test',
  template: '',
  providers: routerProvidersTest,
)
class TestComponent {
  final Router router;

  TestComponent(this.router);
}
