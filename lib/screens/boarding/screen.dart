part of '../screen.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF9BCAC7),
          kWhiteColor,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Image.asset(
            LocalImages.peopleDonutCoin,
            height: 486,
          ),
          const SizedBox(height: 24),
          const Text(
            "Spend Smarter",
            style: TextStyle(
                color: Color(0xFF429690),
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          const Text(
            "Save More",
            style: TextStyle(
                color: Color(0xFF429690),
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Modular.to
                    .pushNamedAndRemoveUntil('/auth/register', (p0) => false),
                style: appTextButtonStyle.merge(
                  ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(kWhiteColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF429690),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have Account?'),
              const SizedBox(width: 6),
              TextButton(
                  onPressed: () => Modular.to
                      .pushNamedAndRemoveUntil('/auth/login', (p0) => false),
                  style: appTextButtonStyle.merge(
                    const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Color(0xFF3E7C78),
                    ),
                  ))
            ],
          ),
        ],
      ),
    ));
  }
}
