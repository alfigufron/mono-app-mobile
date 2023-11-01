part of '../screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToBoardingScreen();
  }

  _navigateToBoardingScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.navigate('/boarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF63B5AF),
                Color(0xFF357873),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Center(child: AppLogo(color: kWhiteColor, size: 52))));
  }
}
