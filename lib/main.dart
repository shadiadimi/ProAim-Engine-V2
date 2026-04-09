import 'package:flutter/material.dart';
import 'package:pro_aim_engine/ui/dashboard.dart';
import 'package:pro_aim_engine/services/overlay_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProAimApp());
}

class ProAimApp extends StatelessWidget {
  const ProAimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProAim Engine',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
