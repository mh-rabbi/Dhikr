import 'package:flutter/material.dart';
import '../main.dart';

class ChangeVoiceButton extends StatelessWidget {
  final bool isVoiceMode;
  final VoidCallback onTap;

  const ChangeVoiceButton({
    super.key,
    required this.isVoiceMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.58,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kGold, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.swap_horiz, color: kGold, size: 16),
              const SizedBox(width: 8),
              Text(
                isVoiceMode ? 'CHANGE TO TAP' : 'CHANGE TO VOICE',
                style: const TextStyle(
                  color: kGold,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
