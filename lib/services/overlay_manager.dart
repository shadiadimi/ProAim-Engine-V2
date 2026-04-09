import 'package:flutter/services.dart';

class OverlayManager {
  static const platform = MethodChannel('com.proaim.engine/overlay');

  /// Shows the floating overlay on top of the game
  static Future<void> showOverlay() async {
    try {
      await platform.invokeMethod('showOverlay');
    } on PlatformException catch (e) {
      print("Failed to show overlay: '${e.message}'.");
    }
  }

  /// Hides the overlay instantly (Panic Mode)
  static Future<void> hideOverlay() async {
    try {
      await platform.invokeMethod('hideOverlay');
    } on PlatformException catch (e) {
      print("Failed to hide overlay: '${e.message}'.");
    }
  }

  /// Updates the trajectory points in real-time
  static Future<void> updateTrajectory(List<double> points) async {
    try {
      // Points are sent in a flat list [x1, y1, x2, y2, ...]
      await platform.invokeMethod('updateTrajectory', {"points": points});
    } on PlatformException catch (e) {
      print("Failed to update trajectory: '${e.message}'.");
    }
  }

  /// Enables advanced stealth mode (Secure Surface)
  /// This prevents the overlay from being captured in screenshots or screen recordings
  static Future<void> enableStealthMode() async {
    try {
      await platform.invokeMethod('enableStealthMode');
    } on PlatformException catch (e) {
      print("Failed to enable stealth mode: '${e.message}'.");
    }
  }

  /// Activates the "Human Pulse" algorithm
  /// Adds micro-vibrations to the overlay lines to mimic natural hand jitter
  static Future<void> enableHumanPulse(bool enabled) async {
    try {
      await platform.invokeMethod('enableHumanPulse', {"enabled": enabled});
    } on PlatformException catch (e) {
      print("Failed to toggle human pulse: '${e.message}'.");
    }
  }
}
