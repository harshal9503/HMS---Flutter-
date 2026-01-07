import 'package:flutter/material.dart';

class PrescriptionProcessingScreen extends StatelessWidget {
  const PrescriptionProcessingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription Processing'),
      ),
      body: const Center(
        child: Text('Prescription Processing Screen'),
      ),
    );
  }
}