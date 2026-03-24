# Dhikr Counter — Flutter App

A single-screen Flutter application that replicates a dark-themed Islamic dhikr (recitation) counter. Built with Flutter and Riverpod for state management.

---

## Project Overview

**Dhikr Counter** lets users track their personal recitations of *Subhanallah* (سُبْحَانَ ٱللَّٰهِ — Glory be to Allah) against a session goal of 33, while displaying a simulated live global recitation count shared by all users worldwide. The UI features gold accents, Arabic calligraphy, and a glowing circular tap target on a pure-black background.

Key features:
- 🕌 Tappable gold circle with subtle scale-down animation
- 📿 Session goal progress bar (0 → 33)
- 🌍 Simulated live global recitation counter (increments every 3 s)
- 🎙 Voice / Tap mode toggle button

---

## Setup Instructions

```bash
# 1. Install dependencies
flutter pub get

# 2. Run on a connected device / emulator
flutter run
```

> Requires Flutter ≥ 3.x and Dart SDK ^3.11.1.

---

## Folder Structure

| Path | Purpose |
|------|---------|
| `lib/main.dart` | App entry point, `ProviderScope`, theme, color constants |
| `lib/providers/dhikr_provider.dart` | `DhikrState`, `DhikrNotifier`, Riverpod provider |
| `lib/screens/dhikr_screen.dart` | Root screen that assembles all widgets |
| `lib/widgets/dhikr_appbar.dart` | Custom Row-based app bar (not Flutter's `AppBar`) |
| `lib/widgets/global_count_badge.dart` | Pill-shaped "GLOBAL LIVE COUNT" badge with green dot |
| `lib/widgets/global_count_display.dart` | Large formatted number + subtitle |
| `lib/widgets/dhikr_circle.dart` | Glowing tappable circle with Arabic text & counter |
| `lib/widgets/change_voice_button.dart` | Gold-bordered toggle button |
| `lib/widgets/session_goal_bar.dart` | Progress bar footer with percentage |

---

## State Management

### `DhikrState`
An **immutable** data class holding:
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| `count` | `int` | `0` | Personal tap count this session |
| `goal` | `int` | `33` | Session goal (hardcoded) |
| `globalCount` | `int` | `2 841 092` | Simulated global recitation total |
| `isVoiceMode` | `bool` | `false` | Whether voice mode is active |

Includes a `copyWith()` method to produce modified copies without mutation.

### `DhikrNotifier`
Extends `StateNotifier<DhikrState>`. Exposes:
- **`increment()`** — adds 1 to `count` (capped at `goal`)
- **`toggleMode()`** — flips `isVoiceMode`
- **`_startGlobalSimulation()`** — internal timer that adds 1–5 to `globalCount` every 3 seconds
- **`dispose()`** — cancels the timer before deallocation

### `StateNotifierProvider`
```dart
final dhikrProvider = StateNotifierProvider<DhikrNotifier, DhikrState>(
  (ref) => DhikrNotifier(),
);
```

### Widget consumption
- **`ref.watch(dhikrProvider)`** — rebuilds the widget tree whenever state changes (used in `DhikrScreen`)
- **`ref.read(dhikrProvider.notifier).increment()`** — fires a one-off action without causing a rebuild (used inside callbacks)

---

## Assumptions

- The **global count** is locally simulated — it is not connected to any backend or real-time database.
- The **session goal** is hardcoded to **33**, a common dhikr repetition count in Islamic tradition.
- Only one dhikr phrase is supported: **Subhanallah** (سُبْحَانَ ٱللَّٰهِ).
- The counter stops at the goal and does not wrap or reset automatically.

---

## Creative Additions

| Feature | Implementation detail |
|---------|----------------------|
| **Tap scale animation** | `AnimatedScale` (100 ms) driven by `onTapDown` / `onTapUp` gesture callbacks inside a `StatefulWidget` |
| **Live global count** | `Timer.periodic(Duration(seconds: 3))` inside `DhikrNotifier` adds a random 1–5 per tick |
| **Voice mode toggle** | Button label and the "TAP TO RECITE" hint swap reactively via `isVoiceMode` state |
| **Ambient glow effect** | Two layered `BoxShadow` entries with `kGold` at 15 % and 8 % opacity, blurRadius 60 and 120 |
| **Arabic RTL rendering** | `GoogleFonts.amiri()` + `textDirection: TextDirection.rtl` ensures correct Arabic calligraphy display |
