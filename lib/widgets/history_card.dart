import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String name;
  final String amount;
  final String date;
  final String type;
  const HistoryCard({
    super.key,
    required this.name,
    required this.amount,
    required this.date,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Text(
              'Rp. $amount',
              style: TextStyle(
                  fontSize: 16,
                  color: type == 'INCOME' ? Colors.green : Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
