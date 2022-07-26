import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:slidy_e_modular/app/app_module.dart';
import 'package:slidy_e_modular/app/modules/auth/auth_module.dart';
import 'package:slidy_e_modular/app/modules/auth/auth_store.dart';
import 'package:slidy_e_modular/app/modules/other/other_module.dart';

void main() {
  setUpAll(() {
    // initModule(AuthModule());
    initModules([AppModule(), AuthModule(), OtherModule()]);
  });

  test('Get controller', () {
    final controller = Modular.get<AuthStore>();
    controller.printParaTeste();
    print(controller.hashCode);

    final name = Modular.get<String>();
    print(name);

    final controllerComInjecao = Modular.get<ControllerComInjecao>();
    controllerComInjecao.printName();
  });
}
