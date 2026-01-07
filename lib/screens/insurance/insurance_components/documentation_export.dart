import 'package:flutter/material.dart';

class DocumentationExportScreen extends StatelessWidget {
  const DocumentationExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentation Export'),
      ),
      body: const Center(
        child: Text('Documentation Export Screen'),
      ),
    );
  }
}