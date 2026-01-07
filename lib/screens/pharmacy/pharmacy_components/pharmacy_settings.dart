import 'package:flutter/material.dart';

class PharmacySettingsScreen extends StatelessWidget {
  const PharmacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Settings'),
      ),
      body: const Center(
        child: Text('Pharmacy Settings Screen'),
      ),
    );
  }
}