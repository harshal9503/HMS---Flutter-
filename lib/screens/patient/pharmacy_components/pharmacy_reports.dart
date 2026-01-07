import 'package:flutter/material.dart';

class PharmacyReportsScreen extends StatelessWidget {
  const PharmacyReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Reports'),
      ),
      body: const Center(
        child: Text('Pharmacy Reports Screen'),
      ),
    );
  }
}