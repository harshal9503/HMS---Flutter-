import 'package:flutter/material.dart';

class ReportUploadsScreen extends StatelessWidget {
  const ReportUploadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Uploads'),
      ),
      body: const Center(
        child: Text('Report Uploads Screen'),
      ),
    );
  }
}