part of '../screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 112, 84),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Afternoon,',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'Alfi Gufron',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Container(
              child: Image.asset(
                'assets/images/notif.png',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(22, 387, 22, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction History',
                  style: TextStyle(fontSize: 18),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(height: 25),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Indonesia University Payroll',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Today',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Text(
                      '+ Rp 10,000,000',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Starbucks Coffee',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Yesterday',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(
                      '- Rp 110,000',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uxertiv Payroll',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Sep 25, 2023',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Text(
                      '+ Rp 2,500,000',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Youtube Premium',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Sep 10, 2023',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Text(
                      '- Rp 109,890',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Spotify Premium',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Today',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Sep 10, 2023',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
