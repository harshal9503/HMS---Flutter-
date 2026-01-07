import 'package:flutter/material.dart';

class MedicationOrdersScreen extends StatelessWidget {
  const MedicationOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Orders'),
      ),
      body: const Center(
        child: Text('Medication Orders Screen'),
      ),
    );
  }
}