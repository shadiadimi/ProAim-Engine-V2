import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

// FFI Definitions to match C++ structs
class EncryptedPoint extends Struct {
  @Uint64()
  external int ex;
  @Uint64()
  external int ey;
}

class Trajectory extends Struct {
  @Array(12)
  external Array<EncryptedPoint> points;
  @Int32()
  external int count;
}

typedef CalculateTrajectoryNative = Trajectory Function(
    Double startX, Double startY, Double angle, Int32 bounces, Double spinSide, Double spinTop);

typedef CalculateTrajectoryDart = Trajectory Function(
    double startX, double startY, double angle, int bounces, double spinSide, double spinTop);

class PhysicsBridge {
  late DynamicLibrary _nativeLib;
  late CalculateTrajectoryDart calculateTrajectory;

  PhysicsBridge() {
    _nativeLib = Platform.isAndroid
        ? DynamicLibrary.open("libphysics_engine.so")
        : DynamicLibrary.process();

    calculateTrajectory = _nativeLib
        .lookup<NativeFunction<CalculateTrajectoryNative>>("calculate_advanced_trajectory")
        .asFunction();
  }

  // Helper to decrypt coordinates from the native struct
  // MEM_KEY = 0xDEADBEEF
  static const int MEM_KEY = 0xDEADBEEF;

  double decrypt(int encrypted) {
    int decrypted = encrypted ^ MEM_KEY;
    // In a real scenario, we'd handle the double conversion properly
    // This is a simplified version for the bridge
    return decrypted.toDouble(); 
  }
}
