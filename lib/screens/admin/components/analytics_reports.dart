import 'package:flutter/material.dart';
import 'package:hms/utils/constants.dart';

class AnalyticsReportsScreen extends StatelessWidget {
  const AnalyticsReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Analytics & Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Content will be added here
          Container(
            height: 400,
            color: Colors.grey[100],
            child: const Center(
              child: Text('Analytics & Reports Content Coming Soon'),
            ),
          ),
        ],
      ),
    );
  }
}