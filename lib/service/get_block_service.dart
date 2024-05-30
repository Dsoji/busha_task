import 'dart:convert';

import 'package:codez/core/const/base.dart';
import 'package:codez/core/models/block_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _logger = Logger();

final getBlockProvider =
    Provider<BlockItemRepository>((ref) => BlockItemRepository());

class BlockItemRepository {
  Stream<List<BlockModel>> fetchBlocks() async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? blockId = prefs.getString('blockId');
    final url = Uri.parse('${BasePaths.baseUrl}$blockId');
    while (true) {
      _logger.d(url);

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['tx'] as List<dynamic>;
        _logger.d("response:$jsonData");

        yield jsonData
            .map((prodJson) => BlockModel.fromJson(prodJson))
            .toList();
      } else {
        _logger.e('Failed to load cart');
        throw Exception('Failed to load cart');
      }

      // Polling interval, adjust as needed
      await Future.delayed(const Duration(seconds: 10));
    }
  }
}

final getBlocksProvider = StreamProvider<List<BlockModel>>((ref) {
  final repository = ref.read(getBlockProvider);
  return repository.fetchBlocks();
});
