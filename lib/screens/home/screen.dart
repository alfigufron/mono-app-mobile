part of '../screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout.v2(
      title: '',
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      appBarBackgroundColor: const Color(0xff2A7C76),
      backgroundImage: Container(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginBlocBuilder(
                  builder: (context, bloc, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Good Afternoon,',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          state.user?.name ?? '',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    );
                  },
                ),
                Image.asset(
                  'assets/images/notif.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MasterCard(),
          SizedBox(height: 12),
          ListTransaction(),
        ],
      ),
    );
  }
}

class ListTransaction extends StatelessWidget {
  const ListTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
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
                height: MediaQuery.of(context).size.height / 3,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(state.history?.records?.length ?? 0,
                        (index) {
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
    );
  }
}

class MasterCard extends StatelessWidget {
  const MasterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeCubitBuilder(
      builder: (context, bloc, state) {
        return Container(
          width: 374,
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
              color: const Color(0xff3E7C78),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Total Balance',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Rp ${state.wallet?.balance}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(40)),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'income',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.wallet?.income ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(40)),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'Expenses',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.wallet?.expense ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
