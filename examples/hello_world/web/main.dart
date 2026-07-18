import 'package:ng_core/angular.dart';

import 'main.template.dart' as ng;

void main() => runApp<HelloWorldComponent>(ng.HelloWorldComponentNgFactory);

@Component(
  selector: 'hello-world',
  template: 'Hello World',
)
class HelloWorldComponent {}
