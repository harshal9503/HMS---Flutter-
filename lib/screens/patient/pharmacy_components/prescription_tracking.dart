import 'package:flutter/material.dart';

class PrescriptionTrackingScreen extends StatelessWidget {
  const PrescriptionTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription Tracking'),
      ),
      body: const Center(
        child: Text('Prescription Tracking Screen'),
      ),
    );
  }
}