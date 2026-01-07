import 'package:flutter/material.dart';

class SessionTrackingScreen extends StatelessWidget {
  const SessionTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Tracking'),
      ),
      body: const Center(
        child: Text('Session Tracking Screen'),
      ),
    );
  }
}