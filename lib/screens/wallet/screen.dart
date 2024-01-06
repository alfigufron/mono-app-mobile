import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mono_app/screens/home/home_cubit_implementor.dart';
import 'package:mono_app/widgets/common/base_layout.dart';
import 'package:mono_app/widgets/history_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout.v2(
      backgroundColor: const Color(0xff2A7C76),
      contentPadding: EdgeInsets.zero,
      title: 'My Wallet',
      backgroundImage: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Text(
                  'My Wallet',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
      appBarBackgroundColor: const Color(0xff2A7C76),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 28, right: 28, left: 28),
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                HomeCubitBuilder(
                  builder: (context, bloc, state) {
                    return Column(
                      children: [
                        const Text(
                          'Total Balance',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Rp ${state.wallet?.balance}',
                          style: const TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Transaction History',
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(fontSize: 17, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                HomeCubitBuilder(
                  builder: (context, bloc, state) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2.1,
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                              state.history?.records?.length ?? 0, (index) {
                            final value = state.history?.records?[index];
                            DateTime date = DateTime.parse(
                                value?.date ?? DateTime.now().toString());

                            String formattedDate =
                                DateFormat('MMM dd, yyyy').format(date);
                            return HistoryCard(
                              type: value?.type ?? '',
                              name: value?.name ?? '',
                              amount: value?.amount ?? '0',
                              date: formattedDate,
                            );
                          }),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
