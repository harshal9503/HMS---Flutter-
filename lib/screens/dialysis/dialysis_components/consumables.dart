import 'package:flutter/material.dart';

class ConsumablesScreen extends StatelessWidget {
  const ConsumablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumables'),
      ),
      body: const Center(
        child: Text('Consumables Screen'),
      ),
    );
  }
}