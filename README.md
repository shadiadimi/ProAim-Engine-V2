# ProAim Engine V2.0 - The Ultimate Aim Assistant

## Overview
ProAim Engine is a high-performance, 100% anti-ban aim assistant for 8 Ball Pool built with Flutter and C++. This version (V2.0) introduces advanced physics and deep stealth features to bypass the latest anti-cheat systems.

## Key Features (Expert Level)
- **Advanced Physics Engine (C++)**: 
  - Real-time trajectory calculation via Dart FFI.
  - **Spin/English Support**: Calculates path deflection based on side and top spin.
  - **Memory Protection**: Uses XOR encryption for coordinates in RAM to prevent detection by memory scanners.
- **Stealth & Security**:
  - **Secure Surface**: Overlay is invisible to system screenshots and screen recorders.
  - **Human Pulse Algorithm**: Micro-vibrations in lines to mimic natural human hand jitter.
  - **Human Error Variance**: 0.001% deviation to avoid "pixel-perfect" pattern detection.
- **Modern UI/UX**:
  - Glassmorphism design using Material Design 3.
  - Real-time controls for bounce count, spin, and human factor.
  - **Panic Mode**: Instant process kill via shake or button.

## Project Structure
- `lib/`: Flutter UI, logic, and overlay management.
- `native_lib/`: C++ Physics Engine (Memory-protected) and CMake build files.
- `android/`: Android-specific configurations, including ProGuard obfuscation rules.

## Security Best Practices
- **ProGuard**: Always build with `--release` to enable code obfuscation.
- **Stealth Mode**: Keep "Stealth Overlay" enabled during gameplay to prevent screen-capture based detection.
- **Human Pulse**: Use the pulse feature to make your playstyle look authentic to AI-based anti-cheat servers.

## Build Instructions
1. Ensure Flutter SDK and Android NDK are installed.
2. Run `flutter pub get`.
3. Build the release APK: `flutter build apk --release`.

## Developer
Built by Expert Programming Team.
