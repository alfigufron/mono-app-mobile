import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mono_app/repositories/transaction.dart';
import 'package:mono_app/screens/home/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final TransactionRepository transactionRepository;
  HomeCubit(this.transactionRepository) : super(const HomeState());

  void getAllTransaction() async {
    emit(state.copyWith(status: FetchStatus.initial));
    final result = await transactionRepository.getAllTransaction();
    result.fold(
        (l) => emit(state.copyWith(failure: l, status: FetchStatus.error)),
        (r) => emit(state.copyWith(status: FetchStatus.loaded, history: r)));
  }

  void getWallet() async {
    emit(state.copyWith(status: FetchStatus.initial));
    final result = await transactionRepository.getWallet();
    result.fold(
        (l) => emit(state.copyWith(failure: l, status: FetchStatus.error)),
        (r) => emit(state.copyWith(status: FetchStatus.loaded, wallet: r)));
  }
}
