import 'package:flutter/material.dart';

class BillingClaimsScreen extends StatelessWidget {
  const BillingClaimsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billing & Claims'),
      ),
      body: const Center(
        child: Text('Billing & Claims Screen'),
      ),
    );
  }
}
