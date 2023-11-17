import 'package:flutter_modular/flutter_modular.dart';
import 'package:mono_app/screens/screen.dart';

class Routes {
  static const splash = "/";
}

class AppRoutes extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreen());
    r.child('/boarding', child: (context) => const BoardingScreen());
    r.child('/auth/login', child: (context) => const LoginScreen());
    r.child('/auth/register', child: (context) => const RegisterScreen());
    r.child('/home', child: (context) => const HomeScreen());
  }
}
