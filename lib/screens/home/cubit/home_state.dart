// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mono_app/common/failures/base_failure.dart';
import 'package:mono_app/models/history.dart';
import 'package:mono_app/models/wallet.dart';

enum FetchStatus { initial, loading, error, loaded }

class HomeState extends Equatable {
  final FetchStatus? status;
  final BaseFailure? failure;
  final History? history;
  final Wallet? wallet;

  const HomeState({
    this.status,
    this.failure,
    this.history,
    this.wallet,
  });

  @override
  List<Object?> get props => [status, failure, history, wallet];

  HomeState copyWith({
    FetchStatus? status,
    BaseFailure? failure,
    History? history,
    Wallet? wallet,
  }) {
    return HomeState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      history: history ?? this.history,
      wallet: wallet ?? this.wallet,
    );
  }
}
