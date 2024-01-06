part of '../screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RegisterCubitListener(
        listener: (BuildContext context, bloc, state) {
          if (state.status == RegisterStatus.loading) {
            const Center(child: CircularProgressIndicator());
          } else if (state.status == RegisterStatus.saved) {
            Modular.to.navigate('/auth/login');
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegisterHeading(),
                      SizedBox(height: 36),
                      FormRegister()
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF747980)),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: () => Modular.to.navigate('/auth/login'),
                        style: appTextButtonStyle,
                        child: const Text(
                          "Sign in",
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
      ),
    );
  }
}

class RegisterHeading extends StatelessWidget {
  const RegisterHeading({Key? key}) : super(key: key);

  final TextStyle headTextStyle = const TextStyle(
      color: Color(0XFF3E7C78), fontSize: 26, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello Moners!", style: headTextStyle),
        Text("Register to started!", style: headTextStyle),
      ],
    );
  }
}

class FormRegister extends StatelessWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterCubitBuilder(builder: (context, cubit, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppInputText(
          label: 'Name',
          icon: LocalIcons.user2,
          hint: 'Your name',
          onChanged: (value) {
            cubit.updatePayload(state.request!.copyWith(fullname: value));
          },
        ),
        const SizedBox(height: 18),
        AppInputText(
          label: 'Email Address',
          icon: LocalIcons.mail2,
          hint: 'Your email',
          onChanged: (value) {
            cubit.updatePayload(state.request!.copyWith(email: value));
          },
        ),
        const SizedBox(height: 18),
        AppInputText(
          label: 'Password',
          icon: LocalIcons.fingerprint4,
          hint: 'Your password',
          obscureText: true,
          onChanged: (value) {
            cubit.updatePayload(state.request!.copyWith(password: value));
          },
        ),
        const SizedBox(height: 26),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'By signing up you agree to our ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF666666)),
              ),
              TextSpan(
                text: 'Terms & Condition ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF429690)),
              ),
              TextSpan(
                text: 'and ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF666666)),
              ),
              TextSpan(
                text: 'Privacy Policy.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF429690)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              cubit.resgister();
            },
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
                'Join Now',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, height: 24 / 14),
              ),
            ),
          ),
        )
      ]);
    });
  }
}
