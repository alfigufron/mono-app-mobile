import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mono_app/screens/login/bloc/login_bloc.dart';
import 'package:mono_app/widgets/common/base_bloc_builder.dart';

class LoginBlocBuilder extends BaseBlocBuilder<LoginBloc, LoginState> {
  const LoginBlocBuilder({
    Key? key,
    required BaseBlocStateBuilder<LoginBloc, LoginState> builder,
    BaseBlocStateCondition<LoginState>? buildWhen,
  }) : super(
          key: key,
          builder: builder,
          buildWhen: buildWhen,
        );

  @override
  LoginBloc bloc(BuildContext context) => BlocProvider.of<LoginBloc>(context);
}

class LoginBlocListener extends BaseBlocListener<LoginBloc, LoginState> {
  const LoginBlocListener({
    Key? key,
    required BaseBlocStateListener<LoginBloc, LoginState> listener,
    BaseBlocStateCondition<LoginState>? listenWhen,
    Widget? child,
  }) : super(
          key: key,
          listener: listener,
          listenWhen: listenWhen,
          child: child,
        );

  @override
  LoginBloc bloc(BuildContext context) => BlocProvider.of<LoginBloc>(context);
}

class LoginBlocConsumer extends BaseBlocConsumer<LoginBloc, LoginState> {
  const LoginBlocConsumer({
    Key? key,
    required BaseBlocStateListener<LoginBloc, LoginState> listener,
    required BaseBlocStateBuilder<LoginBloc, LoginState> builder,
    BaseBlocStateCondition<LoginState>? buildWhen,
    BaseBlocStateCondition<LoginState>? listenWhen,
  }) : super(
          key: key,
          listener: listener,
          builder: builder,
          listenWhen: listenWhen,
          buildWhen: buildWhen,
        );

  @override
  LoginBloc bloc(BuildContext context) => BlocProvider.of<LoginBloc>(context);
}
