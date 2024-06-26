import 'package:codez/service/get_block_service.dart';
import 'package:flutter/material.dart';
import 'package:codez/screens/transaction_details_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class TransactionListScreen extends ConsumerStatefulWidget {
  const TransactionListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionListScreenState();
}

class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BTC transactions'),
      ),
      body: _blockItem(),
    );
  }

  Widget _blockItem() {
    final getBlockAsyncValue = ref.watch(getBlocksProvider);
    return getBlockAsyncValue.when(
      data: (blockItems) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: blockItems.length,
          itemBuilder: (context, index) {
            int timestamp = blockItems[index].time;

            // Convert the Unix timestamp to DateTime
            DateTime date =
                DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

            // Format the DateTime to a readable string
            String formattedDate =
                DateFormat('yyyy-MM-dd  •  kk:mm').format(date);
            return ListTile(
              title: Row(
                children: [
                  SizedBox(
                    width: 303,
                    child: Text(
                      blockItems[index].hash,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              subtitle: Text(formattedDate),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionDetailsScreen(
                        hash: blockItems[index].hash,
                        time: blockItems[index].time,
                        size: blockItems[index].size.toString(),
                        index: blockItems[index].blockIndex.toString(),
                        height: blockItems[index].blockHeight.toString(),
                        receivedTime: ''),
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        );
      },
      loading: () => const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.green,
          ),
          Gap(12),
          Text(
            'Fetching your {BTC} transactions',
            style: TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      )),
      error: (error, stackTrace) {
        _logger.e("Error fetching blocks: $error");
        return const Center(child: Text('Presently no transactions'));
      },
    );
  }
}
