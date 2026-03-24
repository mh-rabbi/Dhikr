import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';
import '../providers/dhikr_provider.dart';
import '../widgets/dhikr_appbar.dart';
import '../widgets/global_count_badge.dart';
import '../widgets/global_count_display.dart';
import '../widgets/dhikr_circle.dart';
import '../widgets/change_voice_button.dart';
import '../widgets/session_goal_bar.dart';

class DhikrScreen extends ConsumerWidget {
  const DhikrScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dhikrProvider);

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            // Ensure the column fills at least the full visible height so
            // Spacer() can push SessionGoalBar to the bottom.
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // 1. App bar
                  const DhikrAppBar(),

                  // 2. Spacing
                  const SizedBox(height: 24),

                  // 3. Live badge
                  const GlobalCountBadge(),

                  // 4. Spacing
                  const SizedBox(height: 12),

                  // 5. Global count number + label
                  GlobalCountDisplay(globalCount: state.globalCount),

                  // 6. Spacing
                  const SizedBox(height: 36),

                  // 7. Tappable circle
                  DhikrCircle(
                    count: state.count,
                    onTap: () =>
                        ref.read(dhikrProvider.notifier).increment(),
                  ),

                  // 8. Spacing
                  const SizedBox(height: 28),

                  // 9. Conditional "TAP TO RECITE" label
                  if (!state.isVoiceMode)
                    const Text(
                      'TAP TO RECITE',
                      style: TextStyle(
                        color: kGrey,
                        fontSize: 11,
                        letterSpacing: 3.0,
                      ),
                    ),

                  // 10. Spacing
                  const SizedBox(height: 16),

                  // 11. Voice / tap toggle button
                  ChangeVoiceButton(
                    isVoiceMode: state.isVoiceMode,
                    onTap: () =>
                        ref.read(dhikrProvider.notifier).toggleMode(),
                  ),

                  // 12. Spacer pushes SessionGoalBar to the bottom
                  const Spacer(),

                  // 13. Progress bar footer
                  SessionGoalBar(
                    count: state.count,
                    goal: state.goal,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
