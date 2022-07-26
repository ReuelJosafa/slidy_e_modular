import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500)).then((_) {
      // Modular.to.navigate('/principal/');
      // Modular.to.navigate('/page1');
      Modular.to.pushReplacementNamed('/principal/');
      // Modular.to.pushReplacementNamed('/page1');
      // Navigator.of(context).pushNamed('/auth/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
