import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mono_app/screens/home/cubit/home_cubit.dart';
import 'package:mono_app/screens/home/cubit/home_state.dart';
import 'package:mono_app/widgets/common/base_bloc_builder.dart';

class HomeCubitBuilder extends BaseBlocBuilder<HomeCubit, HomeState> {
  const HomeCubitBuilder({
    Key? key,
    required BaseBlocStateBuilder<HomeCubit, HomeState> builder,
    BaseBlocStateCondition<HomeState>? buildWhen,
  }) : super(
          key: key,
          builder: builder,
          buildWhen: buildWhen,
        );

  @override
  HomeCubit bloc(BuildContext context) => BlocProvider.of<HomeCubit>(context);
}

class HomeCubitListener extends BaseBlocListener<HomeCubit, HomeState> {
  const HomeCubitListener({
    Key? key,
    required BaseBlocStateListener<HomeCubit, HomeState> listener,
    BaseBlocStateCondition<HomeState>? listenWhen,
    Widget? child,
  }) : super(
          key: key,
          listener: listener,
          listenWhen: listenWhen,
          child: child,
        );

  @override
  HomeCubit bloc(BuildContext context) => BlocProvider.of<HomeCubit>(context);
}

class HomeCubitConsumer extends BaseBlocConsumer<HomeCubit, HomeState> {
  const HomeCubitConsumer({
    Key? key,
    required BaseBlocStateListener<HomeCubit, HomeState> listener,
    required BaseBlocStateBuilder<HomeCubit, HomeState> builder,
    BaseBlocStateCondition<HomeState>? buildWhen,
    BaseBlocStateCondition<HomeState>? listenWhen,
  }) : super(
          key: key,
          listener: listener,
          builder: builder,
          listenWhen: listenWhen,
          buildWhen: buildWhen,
        );

  @override
  HomeCubit bloc(BuildContext context) => BlocProvider.of<HomeCubit>(context);
}
