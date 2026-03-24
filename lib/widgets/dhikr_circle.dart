import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class DhikrCircle extends StatefulWidget {
  final int count;
  final VoidCallback onTap;

  const DhikrCircle({super.key, required this.count, required this.onTap});

  @override
  State<DhikrCircle> createState() => _DhikrCircleState();
}

class _DhikrCircleState extends State<DhikrCircle> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final double diameter = MediaQuery.of(context).size.width * 0.72;

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _scale = 0.95),
      onTapUp: (_) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kCircleBg,
            border: Border.all(
              color: kGold.withOpacity(0.25),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: kGold.withOpacity(0.15),
                blurRadius: 60,
                spreadRadius: 10,
              ),
              BoxShadow(
                color: kGold.withOpacity(0.08),
                blurRadius: 120,
                spreadRadius: 30,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Arabic calligraphy
              Text(
                'سُبْحَانَ ٱللَّٰهِ',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.amiri(
                  color: kGold,
                  fontSize: 42,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'SUBHANALLAH',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3.0,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'GLORY BE TO ALLAH',
                style: TextStyle(
                  color: kGrey,
                  fontSize: 11,
                  letterSpacing: 2.5,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                '${widget.count}',
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
