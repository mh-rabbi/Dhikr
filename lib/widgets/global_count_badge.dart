import 'package:flutter/material.dart';
import '../main.dart';

class GlobalCountBadge extends StatelessWidget {
  const GlobalCountBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1500),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kGold.withOpacity(0.3), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Pulsing green dot
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: kGreenDot,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kGreenDot.withOpacity(0.6),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'GLOBAL LIVE COUNT',
              style: TextStyle(
                color: kGold,
                fontSize: 11,
                letterSpacing: 2.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
