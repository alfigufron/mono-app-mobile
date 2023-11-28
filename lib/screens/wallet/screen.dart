import 'package:flutter/material.dart';
import 'package:mono_app/widgets/common/base_layout.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout.v2(
      backgroundColor: const Color(0xff2A7C76),
      contentPadding: EdgeInsets.zero,
      title: 'My Wallet',
      appBarBackgroundColor: const Color(0xff2A7C76),
      body: Container(
        padding: EdgeInsets.all(28),
        margin: EdgeInsets.only(top: 80),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Rp 30.000.000',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 30),
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
      ),
    );
  }
}
