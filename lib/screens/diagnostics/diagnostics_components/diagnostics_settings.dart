import 'package:flutter/material.dart';

class DiagnosticsSettingsScreen extends StatelessWidget {
  const DiagnosticsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnostics Settings'),
      ),
      body: const Center(
        child: Text('Diagnostics Settings Screen'),
      ),
    );
  }
}