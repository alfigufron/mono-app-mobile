import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mono_app/screens/transaction/cubit/transaction_cubit.dart';
import 'package:mono_app/screens/transaction/cubit/transaction_state.dart';
import 'package:mono_app/widgets/common/base_bloc_builder.dart';

class TransactionCubitBuilder
    extends BaseBlocBuilder<TransactionCubit, TransactionState> {
  const TransactionCubitBuilder({
    Key? key,
    required BaseBlocStateBuilder<TransactionCubit, TransactionState> builder,
    BaseBlocStateCondition<TransactionState>? buildWhen,
  }) : super(
          key: key,
          builder: builder,
          buildWhen: buildWhen,
        );

  @override
  TransactionCubit bloc(BuildContext context) =>
      BlocProvider.of<TransactionCubit>(context);
}

class TransactionCubitListener
    extends BaseBlocListener<TransactionCubit, TransactionState> {
  const TransactionCubitListener({
    Key? key,
    required BaseBlocStateListener<TransactionCubit, TransactionState> listener,
    BaseBlocStateCondition<TransactionState>? listenWhen,
    Widget? child,
  }) : super(
          key: key,
          listener: listener,
          listenWhen: listenWhen,
          child: child,
        );

  @override
  TransactionCubit bloc(BuildContext context) =>
      BlocProvider.of<TransactionCubit>(context);
}

class TransactionCubitConsumer
    extends BaseBlocConsumer<TransactionCubit, TransactionState> {
  const TransactionCubitConsumer({
    Key? key,
    required BaseBlocStateListener<TransactionCubit, TransactionState> listener,
    required BaseBlocStateBuilder<TransactionCubit, TransactionState> builder,
    BaseBlocStateCondition<TransactionState>? buildWhen,
    BaseBlocStateCondition<TransactionState>? listenWhen,
  }) : super(
          key: key,
          listener: listener,
          builder: builder,
          listenWhen: listenWhen,
          buildWhen: buildWhen,
        );

  @override
  TransactionCubit bloc(BuildContext context) =>
      BlocProvider.of<TransactionCubit>(context);
}
