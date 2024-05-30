import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TopMoverItem extends StatelessWidget {
  final String image;
  final String name;
  final double percentage;

  const TopMoverItem({
    super.key,
    required this.name,
    required this.percentage,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 127,
        width: 150,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(8),
            Image.asset(
              image,
              height: 40,
              width: 40,
            ),
            const Gap(8.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                const Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                  size: 14,
                ),
                const Gap(4.0),
                Text(
                  '${percentage.toStringAsFixed(2)}%',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
