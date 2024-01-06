import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mono_app/models/transaction.dart';
import 'package:mono_app/repositories/transaction.dart';
import 'package:mono_app/screens/transaction/cubit/transaction_state.dart';

@injectable
class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository transactionRepository;
  TransactionCubit(this.transactionRepository)
      : super(const TransactionState(
          transaction: Transaction(),
        ));

  void createTransaction() async {
    emit(state.copyWith(saveTransaction: FetchStatus.initial));
    final result =
        await transactionRepository.createTransaction(state.transaction!);
    result.fold(
        (l) => emit(
            state.copyWith(failure: l, saveTransaction: FetchStatus.error)),
        (r) => emit(state.copyWith(saveTransaction: FetchStatus.saved)));
  }

  void editTransaction() async {
    emit(state.copyWith(editTransaction: FetchStatus.initial));
    final result =
        await transactionRepository.updateTransaction(state.transaction!);
    result.fold(
        (l) => emit(
            state.copyWith(failure: l, editTransaction: FetchStatus.error)),
        (r) => emit(state.copyWith(editTransaction: FetchStatus.saved)));
  }

  void deleteTransaction(int id) async {
    emit(state.copyWith(deleteTransaction: FetchStatus.initial));
    final result = await transactionRepository.deleteTransaction(id);
    result.fold(
        (l) => emit(
            state.copyWith(failure: l, deleteTransaction: FetchStatus.error)),
        (r) => emit(state.copyWith(deleteTransaction: FetchStatus.saved)));
  }

  void getDetailTransaction(int id) async {
    emit(state.copyWith(detailTransaction: FetchStatus.initial));
    final result = await transactionRepository.getDetailTransaction(id);
    result.fold(
        (l) => emit(
            state.copyWith(failure: l, detailTransaction: FetchStatus.error)),
        (r) => emit(state.copyWith(
            detailTransaction: FetchStatus.saved, transaction: r)));
  }

  void updatePayload(Transaction request) {
    emit(state.copyWith(transaction: request));
  }
}
