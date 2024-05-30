// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatelessWidget {
  BottomNav(
      {super.key,
      required this.image,
      required this.index,
      required this.onTap,
      required this.color,
      required this.label});
  final String image;
  final Color? color;
  final String label;
  int index;
  void Function()? onTap;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              height: 22,
              width: 22,
              image,
            ),
            const Gap(4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
