import 'package:flutter/material.dart';
import 'package:mono_app/widgets/common/base_layout.dart';
import 'package:mono_app/widgets/common/botton.dart';
import 'package:mono_app/widgets/common/text_input.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout.v2(
      backgroundColor: const Color(0XFFAAAAAA),
      contentPadding: EdgeInsets.zero,
      title: 'Add Transaction',
      appBarBackgroundColor: const Color(0xff2A7C76),
      body: Container(
        padding: EdgeInsets.all(28),
        margin: EdgeInsets.only(top: 80, bottom: 80, left: 24, right: 24),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type'),
            TextInput(
              label: 'Type',
              fillColor: Colors.white,
            ),
            Text('Name'),
            SizedBox(height: 16),
            TextInput(
              label: 'Name',
              fillColor: Colors.white,
            ),
            SizedBox(height: 16),
            Text('Amount'),
            TextInput(
              label: 'Amount',
              fillColor: Colors.white,
            ),
            SizedBox(height: 16),
            Text('Date'),
            TextInput(
              label: 'Date',
              fillColor: Colors.white,
            ),
            SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: Button(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    title: 'Apply',
                    backgroundColor: const Color(0xff3E7C78),
                    onTap: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
