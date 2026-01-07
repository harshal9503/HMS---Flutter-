import 'package:flutter/material.dart';

class DialysisSettingsScreen extends StatelessWidget {
  const DialysisSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialysis Settings'),
      ),
      body: const Center(
        child: Text('Dialysis Settings Screen'),
      ),
    );
  }
}
