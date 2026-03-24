import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/dhikr_screen.dart';

// ─── Color Constants ──────────────────────────────────────────
const Color kBackground = Color(0xFF0A0A0A);
const Color kGold       = Color(0xFFC9A227);
const Color kGoldDark   = Color(0xFF8B6914);
const Color kWhite      = Colors.white;
const Color kGrey       = Color(0xFF888888);
const Color kGreenDot   = Color(0xFF4CAF50);
const Color kCircleBg   = Color(0xFF111111);

void main() {
  runApp(
    const ProviderScope(
      child: DhikrApp(),
    ),
  );
}

class DhikrApp extends StatelessWidget {
  const DhikrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhikr Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackground,
      ),
      home: const DhikrScreen(),
    );
  }
}
