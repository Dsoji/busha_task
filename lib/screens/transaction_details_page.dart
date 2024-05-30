import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final String hash;
  final int time;
  final String size;
  final String index;
  final String height;
  final String receivedTime;

  const TransactionDetailsScreen({
    super.key,
    required this.hash,
    required this.time,
    required this.size,
    required this.index,
    required this.height,
    required this.receivedTime,
  });

  @override
  Widget build(BuildContext context) {
    int timestamp = time;

    // Convert the Unix timestamp to DateTime
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // Format the DateTime to a readable string
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(date);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction details'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TransactionDetailItem(
              title: 'Hash',
              value: hash,
            ),
            const Divider(),
            TransactionDetailItem(
              title: 'Time',
              value: formattedDate,
            ),
            const Divider(),
            TransactionDetailItem(
              title: 'Size',
              value: size,
            ),
            const Divider(),
            TransactionDetailItem(
              title: 'Block index',
              value: index,
            ),
            const Divider(),
            TransactionDetailItem(
              title: 'Height',
              value: height,
            ),
            const Divider(),
            TransactionDetailItem(
              title: 'Received time',
              value: '2019-08-24 • 15:43',
            ),
            const Gap(40),
            InkWell(
              onTap: () {
                // Add functionality to view on blockchain explorer
              },
              child: const Row(
                children: [
                  Icon(Icons.open_in_new),
                  Gap(8),
                  Text(
                    'View on blockchain explorer',
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionDetailItem extends StatelessWidget {
  final String title;
  final String value;

  TransactionDetailItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
