import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mono_app/common/injection/injection.dart';
import 'package:mono_app/common/routes/route.dart';
import 'package:mono_app/widgets/global_state_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([configureDependencies()]);
  runApp(ModularApp(
      module: AppRoutes(), child: const GlobalStateProvider(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Mono App',
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(),
            child: child ?? Container(),
          );
        },
        theme: ThemeData(
            fontFamily: 'Inter',
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
