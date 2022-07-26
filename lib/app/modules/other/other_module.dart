import 'package:flutter_modular/flutter_modular.dart';

class OtherModule extends Module {
  @override
  final List<Bind> binds = [
    //Virá injeção do app_module
    Bind.lazySingleton((i) => ControllerComInjecao(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [];
}

class ControllerComInjecao {
  final String name;
  final bool isInjected;

  ControllerComInjecao(this.name, this.isInjected);

  printName() {
    print('Name: $name, é $isInjected');
  }
}
