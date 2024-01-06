import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mono_app/common/injection/injection.dart';
import 'package:mono_app/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:mono_app/screens/home/cubit/home_cubit.dart';
import 'package:mono_app/screens/transaction/cubit/transaction_cubit.dart';
import 'package:mono_app/screens/transaction/cubit/transaction_state.dart';
import 'package:mono_app/screens/transaction/transaction_bloc_implementor.dart';
import 'package:mono_app/widgets/common/base_layout.dart';
import 'package:mono_app/widgets/common/botton.dart';
import 'package:mono_app/widgets/common/calendart.dart';
import 'package:mono_app/widgets/common/dropdown.dart';
import 'package:mono_app/widgets/widget.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout.v2(
      backgroundColor: const Color(0XFFAAAAAA),
      contentPadding: EdgeInsets.zero,
      title: 'Add Transaction',
      appBarBackgroundColor: const Color(0xff2A7C76),
      backgroundImage: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 18),
                 Text(
                  'Add Transaction',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<TransactionCubit>(),
        child: TransactionCubitListener(
          listener: (context, bloc, state) {
            if (state.saveTransaction == FetchStatus.loading) {
              const CircularProgressIndicator();
            }
            if (state.saveTransaction == FetchStatus.saved) {
              context.read<HomeCubit>()
                ..getAllTransaction()
                ..getWallet();
              context.read<DashboardCubit>().updateMenu(HomeMenu.home);
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 70, left: 24, bottom: 60, right: 24),
            child: Container(
              padding: const EdgeInsets.all(28),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TransactionCubitBuilder(
                builder: (context, bloc, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyDropdownTextField(
                        items: const [
                          'INCOME',
                          'EXPENSE',
                        ],
                        onItemSelected: (String selectedValue) {
                          bloc.updatePayload(
                              state.transaction!.copyWith(type: selectedValue));
                        },
                      ),
                      const SizedBox(height: 16),
                      AppInputText(
                        label: 'Name',
                        onChanged: (value) {
                          bloc.updatePayload(
                              state.transaction!.copyWith(name: value));
                        },
                      ),
                      const SizedBox(height: 16),
                      AppInputText(
                        label: 'Amount',
                        onChanged: (value) {
                          bloc.updatePayload(
                              state.transaction!.copyWith(amount: value));
                        },
                      ),
                      const SizedBox(height: 16),
                      DatePickerTextField(
                        label: 'Date',
                        onDateSelected: (value) {
                          bloc.updatePayload(state.transaction!.copyWith(
                              date: DateFormat('DD-MM-yyyy')
                                  .format(value)
                                  .toString()));
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Button(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              title: 'Apply',
                              backgroundColor: const Color(0xff3E7C78),
                              onTap: () {
                                bloc.createTransaction();
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
