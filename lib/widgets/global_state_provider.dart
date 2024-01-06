import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mono_app/common/injection/injection.dart';
import 'package:mono_app/screens/home/cubit/home_cubit.dart';
import 'package:mono_app/screens/login/bloc/login_bloc.dart';
import 'package:mono_app/screens/register/cubit/register_cubit.dart';

class GlobalStateProvider extends StatelessWidget {
  final Widget child;
  const GlobalStateProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
        ),
        BlocProvider(
            create: (context) => getIt<HomeCubit>()
              ..getAllTransaction()
              ..getWallet()),
      ],
      child: child,
    );
  }
}
