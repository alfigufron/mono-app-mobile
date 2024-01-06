part of '../screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigateToBoardingScreen() async {
    Modular.to.navigate('/dashboard');
  }

  _navigateToLoginScreen() async {
    Modular.to.navigate('/auth/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: BlocProvider(
      create: (context) => getIt<SplashCubit>()..checkTokenAvailability(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccessRetrievingToken) {
            _navigateToBoardingScreen();
          } else if (state is SplashFailedRetrievingToken) {
            _navigateToLoginScreen();
          } else {
            _navigateToLoginScreen();
          }
        },
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF63B5AF),
                Color(0xFF357873),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: const Center(child: AppLogo(color: kWhiteColor, size: 52))),
      ),
    ));
  }
}
