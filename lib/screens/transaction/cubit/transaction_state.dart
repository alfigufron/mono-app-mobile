// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mono_app/common/failures/base_failure.dart';
import 'package:mono_app/models/transaction.dart';

enum FetchStatus { initial, loading, error, saved }

class TransactionState extends Equatable {
  final FetchStatus? saveTransaction;
  final FetchStatus? detailTransaction;
  final FetchStatus? editTransaction;
  final FetchStatus? deleteTransaction;
  final BaseFailure? failure;
  final Transaction? transaction;

  const TransactionState({
    this.saveTransaction,
    this.detailTransaction,
    this.editTransaction,
    this.deleteTransaction,
    this.failure,
    this.transaction,
  });

  TransactionState copyWith({
    FetchStatus? saveTransaction,
    FetchStatus? detailTransaction,
    FetchStatus? editTransaction,
    FetchStatus? deleteTransaction,
    BaseFailure? failure,
    Transaction? transaction,
  }) {
    return TransactionState(
      saveTransaction: saveTransaction ?? this.saveTransaction,
      detailTransaction: detailTransaction ?? this.detailTransaction,
      editTransaction: editTransaction ?? this.editTransaction,
      deleteTransaction: deleteTransaction ?? this.deleteTransaction,
      failure: failure ?? this.failure,
      transaction: transaction ?? this.transaction,
    );
  }

  @override
  List<Object?> get props {
    return [
      saveTransaction,
      detailTransaction,
      editTransaction,
      deleteTransaction,
      failure,
      transaction,
    ];
  }
}
