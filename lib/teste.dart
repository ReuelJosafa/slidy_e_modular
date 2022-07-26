import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_e_modular/app/modules/auth/auth_module.dart';

import 'app/modules/home/home_module.dart';

class TesteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Modular.setInitialRoute('/tab');

    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class TesteModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (context, args) => const SplashScreen()),
        // ChildRoute('/', child: (context, args) => const SplashScreen()),
        ChildRoute('/', child: (context, args) => TestePage(), children: [
          // ChildRoute('/splash', child: (context, args) => const SplashScreen()),
          ChildRoute('/page1',
              child: (context, args) =>
                  const InternalPage(title: 'page 1', color: Colors.red)),
          ChildRoute('/page2',
              child: (context, args) =>
                  const InternalPage(title: 'page 2', color: Colors.amber)),
          ModuleRoute('/home', module: HomeModule()),
          ModuleRoute('/other', module: AuthModule()),
        ]),
      ];
}

class TestePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leading = SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: NavigationListener(builder: (context, wdg) {
        return Column(
          children: [
            ListTile(
              selected: Modular.to.path.endsWith('page1'),
              title: const Text('Page 1'),
              onTap: () => Modular.to.navigate('/principal/other/'),
            ),
            ListTile(
              selected: Modular.to.path.endsWith('page2'),
              title: const Text('Page 2'),
              onTap: () => Modular.to.navigate('/principal/page2'),
            ),
            ListTile(
              selectedTileColor: Colors.grey,
              selected: Modular.to.path.endsWith('/home/'),
              title: const Text('Page 3'),
              onTap: () {
                print(Modular.to.path);
                Modular.to.pushNamed('/principal/home/');
              },
            ),
          ],
        );
      }),
    );

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
