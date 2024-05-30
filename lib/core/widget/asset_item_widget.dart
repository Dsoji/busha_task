import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AssetItem extends StatelessWidget {
  final String name;
  final String price;
  final String percentage;
  final String image;
  final String abbrv;

  const AssetItem({
    super.key,
    required this.name,
    required this.price,
    required this.percentage,
    required this.image,
    required this.abbrv,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                height: 40,
                width: 40,
              ),
              const Gap(16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(price,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400)),
                  Text(abbrv,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      )),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
              Text(percentage,
                  style: const TextStyle(fontSize: 14.0, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}
