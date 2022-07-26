import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_e_modular/teste.dart';

import 'app/splash/splash_screen.dart';

/* void main() =>
    runApp(ModularApp(module: AppModule(), child: const AppWidget())); */

void main() {
  return runApp(ModularApp(module: TabModule(), child: AppWidget()));
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Modular.setInitialRoute('/page1');
    // Modular.setInitialRoute('/home');

    Modular.to.addListener(() {
      debugPrint(Modular.to.path);
    });

    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const SplashScreen(),
        ),
        ModuleRoute('/home', module: HomeModule()),
        /* ChildRoute(
          '/tab',
          child: (context, args) => HomePage(),
          children: [
            ModuleRoute('/home', module: HomeModule()),
            // ModuleRoute('/product', module: Module2()),
            // ModuleRoute('/config', module: Module3()),
          ],
        ), */
        // ModuleRoute('/home',module:  HomeModule()),
        /*  ChildRoute('/home', child: (context, args) => HomePage(), children: [
          ChildRoute('/page1',
              child: (context, args) =>
                  InternalPage(title: 'page 1', color: Colors.red)),
          ChildRoute('/page2',
              child: (context, args) =>
                  InternalPage(title: 'page 2', color: Colors.amber)),
          ChildRoute('/page3',
              child: (context, args) =>
                  InternalPage(title: 'page 3', color: Colors.green)),
        ]), */
      ];
}

class TabModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashScreen()),
        ModuleRoute('/principal', module: TesteModule()),
        /* ChildRoute(
          '/tab',
          child: (context, args) => HomePage(),
          children: [
            ModuleRoute('/home', module: HomeModule()),
            ModuleRoute('/other', module: OtherModule()),
            ChildRoute('/page3',
                child: (context, args) =>
                    const InternalPage(title: 'page 3', color: Colors.green)),
          ],
        ), */
      ];
}

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => Container(color: Colors.red)),
      ];
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/other');

    final leading = SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        children: [
          ListTile(
            title: const Text('Page 1'),
            onTap: () => Modular.to.navigate('./home'),
          ),
          ListTile(
            title: const Text('Page 2'),
            onTap: () => Modular.to.pushReplacementNamed('./other'),
          ),
          ListTile(
            title: const Text('Page 3'),
            onTap: () => Modular.to.navigate('/page3'),
          ),
        ],
      ),
    );

    // return RouterOutlet();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Row(
        children: [
          leading,
          Container(width: 2, color: Colors.black45),
          const Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }
}

class InternalPage extends StatelessWidget {
  final String title;
  final Color color;
  const InternalPage({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Center(child: Text(title)),
    );
  }
}

class OtherModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => Container(color: Colors.amber)),
      ];
}
