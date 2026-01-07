import 'package:flutter/material.dart';

class MedicineInventoryScreen extends StatelessWidget {
  const MedicineInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Inventory'),
      ),
      body: const Center(
        child: Text('Medicine Inventory Screen'),
      ),
    );
  }
}