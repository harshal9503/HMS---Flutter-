import 'package:flutter/material.dart';

class RadiologyTestOrdersScreen extends StatelessWidget {
  const RadiologyTestOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radiology Test Orders'),
      ),
      body: const Center(
        child: Text('Radiology Test Orders Screen'),
      ),
    );
  }
}