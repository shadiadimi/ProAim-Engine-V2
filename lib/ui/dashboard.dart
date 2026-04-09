import 'package:flutter/material.dart';
import 'package:pro_aim_engine/services/overlay_manager.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isAutoPlay = false;
  bool isStealthMode = true;
  bool isHumanPulse = true;
  int bounceCount = 3;
  double humanFactor = 0.5;
  double sideSpin = 0.0;
  double topSpin = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProAim Engine V2.0', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.blueGrey.shade900],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildEngineStatus(),
              const SizedBox(height: 16),
              _buildPhysicsControls(),
              const SizedBox(height: 16),
              _buildSecuritySettings(),
              const SizedBox(height: 16),
              _buildPanicSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEngineStatus() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('SYSTEM STATUS', style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  const Text('ACTIVE & STEALTH', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => OverlayManager.showOverlay(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            child: const Text('START ENGINE'),
          ),
        ],
      ),
    );
  }

  Widget _buildPhysicsControls() {
    return _buildCard(
      title: 'PHYSICS ENGINE (V3.1)',
      child: Column(
        children: [
          _buildSlider('Bounce Count', bounceCount.toDouble(), 1, 6, (v) => setState(() => bounceCount = v.toInt())),
          _buildSlider('Side Spin (English)', sideSpin, -1, 1, (v) => setState(() => sideSpin = v)),
          _buildSlider('Top/Back Spin', topSpin, -1, 1, (v) => setState(() => topSpin = v)),
        ],
      ),
    );
  }

  Widget _buildSecuritySettings() {
    return _buildCard(
      title: 'SECURITY & ANTI-BAN',
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Stealth Overlay'),
            subtitle: const Text('Invisible to Screen Capture'),
            value: isStealthMode,
            onChanged: (v) {
              setState(() => isStealthMode = v);
              OverlayManager.enableStealthMode();
            },
          ),
          SwitchListTile(
            title: const Text('Human Pulse'),
            subtitle: const Text('Mimic Hand Vibration'),
            value: isHumanPulse,
            onChanged: (v) {
              setState(() => isHumanPulse = v);
              OverlayManager.enableHumanPulse(v);
            },
          ),
          _buildSlider('Human Factor Variance', humanFactor, 0, 1, (v) => setState(() => humanFactor = v)),
        ],
      ),
    );
  }

  Widget _buildPanicSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Text('PANIC MODE ACTIVE', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Shake phone or press below to kill process', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => OverlayManager.hideOverlay(),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.redAccent, side: const BorderSide(color: Colors.redAccent)),
              child: const Text('INSTANT KILL'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.blueAccent, fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
          activeColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
