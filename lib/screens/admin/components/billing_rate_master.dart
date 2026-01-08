import 'package:flutter/material.dart';
import 'package:hms/utils/constants.dart';

class BillingRateMasterScreen extends StatelessWidget {
  const BillingRateMasterScreen({super.key});

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
            'Billing Rate Master',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Content will be added here
          Container(
            height: 400,
            color: Colors.grey[100],
            child: const Center(
              child: Text('Billing Rate Master Content Coming Soon'),
            ),
          ),
        ],
      ),
    );
  }
}