import 'package:flutter/material.dart';

class InsuranceSettingsScreen extends StatelessWidget {
  const InsuranceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance Settings'),
      ),
      body: const Center(
        child: Text('Insurance Settings Screen'),
      ),
    );
  }
}