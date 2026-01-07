import 'package:flutter/material.dart';

class PaymentTrackingScreen extends StatelessWidget {
  const PaymentTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Tracking'),
      ),
      body: const Center(
        child: Text('Payment Tracking Screen'),
      ),
    );
  }
}