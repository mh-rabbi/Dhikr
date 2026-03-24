import 'package:flutter/material.dart';
import '../main.dart';

class SessionGoalBar extends StatelessWidget {
  final int count;
  final int goal;

  const SessionGoalBar({super.key, required this.count, required this.goal});

  @override
  Widget build(BuildContext context) {
    final double progress = goal > 0 ? count / goal : 0.0;
    final int percent = (progress * 100).floor();

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: kGold.withOpacity(0.2)),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        children: [
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              backgroundColor: const Color(0xFF1A1A1A),
              valueColor: const AlwaysStoppedAnimation<Color>(kGold),
              minHeight: 3,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: label + count
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SESSION GOAL',
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 10,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$count / $goal',
                    style: const TextStyle(
                      color: kWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              // Right: percentage
              Text(
                '$percent% COMPLETE',
                style: const TextStyle(
                  color: kGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
