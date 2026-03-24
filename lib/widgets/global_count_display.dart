import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class GlobalCountDisplay extends StatelessWidget {
  final int globalCount;

  const GlobalCountDisplay({super.key, required this.globalCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          NumberFormat('#,##0').format(globalCount),
          style: const TextStyle(
            color: kWhite,
            fontSize: 38,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'TOTAL RECITATIONS TODAY',
          style: TextStyle(
            color: kGold,
            fontSize: 11,
            letterSpacing: 3.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
