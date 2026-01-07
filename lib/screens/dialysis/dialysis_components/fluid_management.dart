import 'package:flutter/material.dart';

class FluidManagementScreen extends StatelessWidget {
  const FluidManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluid Management'),
      ),
      body: const Center(
        child: Text('Fluid Management Screen'),
      ),
    );
  }
}