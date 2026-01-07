import 'package:flutter/material.dart';

class PharmacyBillingScreen extends StatelessWidget {
  const PharmacyBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Billing'),
      ),
      body: const Center(
        child: Text('Pharmacy Billing Screen'),
      ),
    );
  }
}