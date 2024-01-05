import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mono_app/screens/login/bloc/login_bloc.dart';
import 'package:mono_app/screens/login/login_bloc_implementor.dart';
import 'package:mono_app/widgets/common/base_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout.v2(
      backgroundColor: const Color(0xff2A7C76),
      contentPadding: EdgeInsets.zero,
      title: 'My Profile',
      appBarBackgroundColor: const Color(0xff2A7C76),
      body: LoginBlocBuilder(builder: (context, bloc, state) {
        return Container(
          padding: const EdgeInsets.all(28),
          margin: const EdgeInsets.only(top: 80),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://ajaib.co.id/wp-content/uploads/2020/06/steve-jobs.jpg',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  state.user?.name ?? '',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  state.user?.email ?? '',
                  style: const TextStyle(
                    color: Color(0xff438883),
                  ),
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    bloc.add(Logout());
                    Modular.to.navigate('/auth/login');
                  },
                  child: const Text(
                    'Log out',
                    style: TextStyle(
                      color: Color(0xffE21818),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
