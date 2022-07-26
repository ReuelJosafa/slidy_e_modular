import 'package:slidy_e_modular/app/modules/auth/auth_page.dart';
import 'package:slidy_e_modular/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    //quando for importado no app_module para ser utiliazado em um module irmão precisamos setar true no exports
    Bind.instance<bool>(true, export: true),
    Bind.factory((i) => AuthStore()),
    // Bind.singleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
  ];
}
