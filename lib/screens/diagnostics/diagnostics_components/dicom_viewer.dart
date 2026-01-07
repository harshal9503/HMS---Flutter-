import 'package:flutter/material.dart';

class DicomViewerScreen extends StatelessWidget {
  const DicomViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DICOM Viewer'),
      ),
      body: const Center(
        child: Text('DICOM Viewer Screen'),
      ),
    );
  }
}