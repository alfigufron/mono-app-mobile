import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mono_app/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:mono_app/screens/dashboard/cubit/dashboard_cubit_builder.dart';
import 'package:mono_app/screens/home/cubit/home_cubit.dart';
import 'package:mono_app/screens/login/bloc/login_bloc.dart';
import 'package:mono_app/screens/profile/screen.dart';
import 'package:mono_app/screens/screen.dart';
import 'package:mono_app/screens/transaction/cubit/transaction_cubit.dart';
import 'package:mono_app/screens/transaction/screen.dart';
import 'package:mono_app/screens/wallet/screen.dart';
import 'package:mono_app/widgets/common/base_layout.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LoginBloc>().add(UpdateUser());
    context.read<HomeCubit>()
      ..getAllTransaction()
      ..getWallet();
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: const _DashboardScreen(),
    );
  }
}

class _DashboardScreen extends StatefulWidget {
  const _DashboardScreen();

  @override
  State<_DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<_DashboardScreen> {
  Tween<double> _getTween() {
    return Tween(begin: 0, end: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DashboardCubitBuilder(builder: (context, cubit, state) {
      return BaseLayout.v2(
        title: '',
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.linear,
          switchOutCurve: Curves.linear,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: _getTween().animate(animation),
            child: child,
          ),
          child: [
            const HomeScreen(),
            const TransactionScreen(),
            const WalletScreen(),
            const ProfileScreen(),
          ].elementAt(state.menu.index),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              iconSize: 36,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xff549994),
              unselectedItemColor: const Color(0xffAAAAAA),
              currentIndex: state.menu.index,
              onTap: (value) {
                cubit.updateMenu(HomeMenu.values.elementAt(value));
              },
              items: [
                BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.home_outlined,
                        size: 24,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.queue_outlined,
                        size: 24,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet_rounded,
                        size: 24,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.account_circle_outlined,
                        size: 24,
                      ),
                    ),
                    label: ''),
              ],
            ),
          ],
        ),
      );
    });
  }
}
