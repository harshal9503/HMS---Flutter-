import 'package:flutter/material.dart';

class DialysisBillingScreen extends StatelessWidget {
  const DialysisBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialysis Billing'),
      ),
      body: const Center(
        child: Text('Dialysis Billing Screen'),
      ),
    );
  }
}