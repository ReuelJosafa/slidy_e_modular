import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_e_modular/app/modules/auth/auth_module.dart';
import 'package:slidy_e_modular/app/splash/splash_screen.dart';

import 'modules/auth/auth_page.dart';
import 'modules/home/home_page.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [AuthModule()];

  //Tudo o que está aqui é global, portanto, todos os outros modulos poderão acessá-lo.
  @override
  final List<Bind> binds = [
    Bind.instance<String>('Reuel'),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const SplashScreen()),
    ModuleRoute('/${AuthPage.id}', module: AuthModule()),
    // ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
