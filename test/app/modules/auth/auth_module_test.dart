import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:slidy_e_modular/app/modules/auth/auth_module.dart';
import 'package:slidy_e_modular/app/modules/auth/auth_store.dart';

void main() {
  setUpAll(() {
    // initModule(AuthModule());
    initModules([AuthModule()]);
  });

  test('Get controllers', () {
    //São intânias diferentes
    final controller = Modular.get<AuthStore>();
    final controller2 = Modular.get<AuthStore>();
    controller.printParaTeste();
    print(controller.hashCode);
    print(controller2.hashCode);
  });
}
