import 'package:flutter/material.dart';

class InsuranceBillingScreen extends StatelessWidget {
  const InsuranceBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance Billing'),
      ),
      body: const Center(
        child: Text('Insurance Billing Screen'),
      ),
    );
  }
}