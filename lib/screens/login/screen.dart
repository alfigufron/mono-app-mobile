part of '../screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [LoginHeading(), SizedBox(height: 36), FormLogin()],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF747980)),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () => Modular.to.navigate('/auth/register'),
                      style: appTextButtonStyle,
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF429690)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginHeading extends StatelessWidget {
  const LoginHeading({Key? key}) : super(key: key);

  final TextStyle headTextStyle = const TextStyle(
      color: Color(0XFF3E7C78), fontSize: 26, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back", style: headTextStyle),
        Text("Glad to see you, again!", style: headTextStyle),
      ],
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const AppInputText(
        label: 'Email Address',
        icon: LocalIcons.mail2,
        hint: 'Your email',
      ),
      const SizedBox(height: 18),
      const AppInputText(
        label: 'Password',
        icon: LocalIcons.fingerprint4,
        hint: 'Your password',
        obscureText: true,
      ),
      const SizedBox(height: 26),
      SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () => print('login'),
          style: appTextButtonStyle.merge(
            ButtonStyle(
              foregroundColor: MaterialStateProperty.all(kWhiteColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF429690),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Log In',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, height: 24 / 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
    ]);
  }
}
