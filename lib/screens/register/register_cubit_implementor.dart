import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mono_app/screens/register/cubit/register_cubit.dart';
import 'package:mono_app/screens/register/cubit/register_state.dart';
import 'package:mono_app/widgets/common/base_bloc_builder.dart';

class RegisterCubitBuilder extends BaseBlocBuilder<RegisterCubit, RegisterState> {
  const RegisterCubitBuilder({
    Key? key,
    required BaseBlocStateBuilder<RegisterCubit, RegisterState> builder,
    BaseBlocStateCondition<RegisterState>? buildWhen,
  }) : super(
          key: key,
          builder: builder,
          buildWhen: buildWhen,
        );

  @override
  RegisterCubit bloc(BuildContext context) => BlocProvider.of<RegisterCubit>(context);
}

class RegisterCubitListener extends BaseBlocListener<RegisterCubit, RegisterState> {
  const RegisterCubitListener({
    Key? key,
    required BaseBlocStateListener<RegisterCubit, RegisterState> listener,
    BaseBlocStateCondition<RegisterState>? listenWhen,
    Widget? child,
  }) : super(
          key: key,
          listener: listener,
          listenWhen: listenWhen,
          child: child,
        );

  @override
  RegisterCubit bloc(BuildContext context) => BlocProvider.of<RegisterCubit>(context);
}

class RegisterCubitConsumer extends BaseBlocConsumer<RegisterCubit, RegisterState> {
  const RegisterCubitConsumer({
    Key? key,
    required BaseBlocStateListener<RegisterCubit, RegisterState> listener,
    required BaseBlocStateBuilder<RegisterCubit, RegisterState> builder,
    BaseBlocStateCondition<RegisterState>? buildWhen,
    BaseBlocStateCondition<RegisterState>? listenWhen,
  }) : super(
          key: key,
          listener: listener,
          builder: builder,
          listenWhen: listenWhen,
          buildWhen: buildWhen,
        );

  @override
  RegisterCubit bloc(BuildContext context) => BlocProvider.of<RegisterCubit>(context);
}
