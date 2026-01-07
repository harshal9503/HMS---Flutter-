import 'package:flutter/material.dart';

Map<String, Color> moduleColors = {
  'External Doctor': const Color(0xFF4299E1),      // Blue
  'Reception': const Color(0xFF48BB78),           // Green
  'Doctor': const Color(0xFF9F7AEA),              // Purple
  'Nurses': const Color(0xFFED8936),              // Orange
  'Pharmacy': const Color(0xFFF56565),            // Red
  'Laboratory': const Color(0xFF38B2AC),          // Teal
  'Admin': const Color(0xFF667EEA),               // Indigo
  'Insurance': const Color(0xFFED64A6),           // Pink
  'Diagnostics': const Color(0xFF68D391),         // Emerald
  'Dialysis': const Color(0xFFF6AD55),            // Yellow Orange
  'Patient': const Color(0xFF4FD1C7),             // Cyan
};

List<Map<String, dynamic>> modules = [
  {
    'name': 'External Doctor',
    'icon': Icons.people_alt_outlined,
    'color': moduleColors['External Doctor']!,
    'isPremium': false,
  },
  {
    'name': 'Reception',
    'icon': Icons.desktop_mac_outlined,
    'color': moduleColors['Reception']!,
    'isPremium': true,
  },
  {
    'name': 'Doctor',
    'icon': Icons.person_outline,
    'color': moduleColors['Doctor']!,
    'isPremium': true,
  },
  {
    'name': 'Nurses',
    'icon': Icons.medical_services_outlined,
    'color': moduleColors['Nurses']!,
    'isPremium': true,
  },
  {
    'name': 'Pharmacy',
    'icon': Icons.local_pharmacy_outlined,
    'color': moduleColors['Pharmacy']!,
    'isPremium': true,
  },
  {
    'name': 'Laboratory',
    'icon': Icons.science_outlined,
    'color': moduleColors['Laboratory']!,
    'isPremium': true,
  },
  {
    'name': 'Admin',
    'icon': Icons.admin_panel_settings_outlined,
    'color': moduleColors['Admin']!,
    'isPremium': false,
  },
  {
    'name': 'Insurance',
    'icon': Icons.attach_money_outlined,
    'color': moduleColors['Insurance']!,
    'isPremium': false,
  },
  {
    'name': 'Diagnostics',
    'icon': Icons.analytics_outlined,
    'color': moduleColors['Diagnostics']!,
    'isPremium': false,
  },
  {
    'name': 'Dialysis',
    'icon': Icons.bloodtype_outlined,
    'color': moduleColors['Dialysis']!,
    'isPremium': false,
  },
  {
    'name': 'Patient',
    'icon': Icons.person_pin_outlined,
    'color': moduleColors['Patient']!,
    'isPremium': false,
  },
];