import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ─── DhikrState ───────────────────────────────────────────────
class DhikrState {
  final int count;
  final int goal;
  final int globalCount;
  final bool isVoiceMode;

  const DhikrState({
    required this.count,
    required this.goal,
    required this.globalCount,
    required this.isVoiceMode,
  });

  DhikrState copyWith({
    int? count,
    int? goal,
    int? globalCount,
    bool? isVoiceMode,
  }) {
    return DhikrState(
      count: count ?? this.count,
      goal: goal ?? this.goal,
      globalCount: globalCount ?? this.globalCount,
      isVoiceMode: isVoiceMode ?? this.isVoiceMode,
    );
  }
}

// ─── DhikrNotifier ───────────────────────────────────────────
class DhikrNotifier extends StateNotifier<DhikrState> {
  Timer? _timer;
  final Random _random = Random();

  DhikrNotifier()
      : super(const DhikrState(
          count: 0,
          goal: 33,
          globalCount: 2841092,
          isVoiceMode: false,
        )) {
    _startGlobalSimulation();
  }

  void increment() {
    if (state.count < state.goal) {
      state = state.copyWith(count: state.count + 1);
    }
  }

  void toggleMode() {
    state = state.copyWith(isVoiceMode: !state.isVoiceMode);
  }

  void _startGlobalSimulation() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      final addition = _random.nextInt(5) + 1; // 1–5
      state = state.copyWith(globalCount: state.globalCount + addition);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

// ─── Provider ─────────────────────────────────────────────────
final dhikrProvider = StateNotifierProvider<DhikrNotifier, DhikrState>(
  (ref) => DhikrNotifier(),
);
