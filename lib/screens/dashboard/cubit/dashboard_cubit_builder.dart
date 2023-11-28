import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mono_app/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:mono_app/widgets/common/base_bloc_builder.dart';

class DashboardCubitBuilder
    extends BaseBlocBuilder<DashboardCubit, DashboardState> {
  const DashboardCubitBuilder({
    Key? key,
    required BaseBlocStateBuilder<DashboardCubit, DashboardState> builder,
    BaseBlocStateCondition<DashboardState>? buildWhen,
  }) : super(
          key: key,
          builder: builder,
          buildWhen: buildWhen,
        );

  @override
  DashboardCubit bloc(BuildContext context) =>
      BlocProvider.of<DashboardCubit>(context);
}

class DashboardCubitListener
    extends BaseBlocListener<DashboardCubit, DashboardState> {
  const DashboardCubitListener({
    Key? key,
    required BaseBlocStateListener<DashboardCubit, DashboardState> listener,
    BaseBlocStateCondition<DashboardState>? listenWhen,
    Widget? child,
  }) : super(
          key: key,
          listener: listener,
          listenWhen: listenWhen,
          child: child,
        );

  @override
  DashboardCubit bloc(BuildContext context) =>
      BlocProvider.of<DashboardCubit>(context);
}

class DashboardCubitConsumer
    extends BaseBlocConsumer<DashboardCubit, DashboardState> {
  const DashboardCubitConsumer({
    Key? key,
    required BaseBlocStateListener<DashboardCubit, DashboardState> listener,
    required BaseBlocStateBuilder<DashboardCubit, DashboardState> builder,
    BaseBlocStateCondition<DashboardState>? buildWhen,
    BaseBlocStateCondition<DashboardState>? listenWhen,
  }) : super(
          key: key,
          listener: listener,
          builder: builder,
          listenWhen: listenWhen,
          buildWhen: buildWhen,
        );

  @override
  DashboardCubit bloc(BuildContext context) =>
      BlocProvider.of<DashboardCubit>(context);
}
