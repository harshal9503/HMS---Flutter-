import 'package:flutter/material.dart';

class ConsumptionHistoryScreen extends StatelessWidget {
  const ConsumptionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumption History'),
      ),
      body: const Center(
        child: Text('Consumption History Screen'),
      ),
    );
  }
}