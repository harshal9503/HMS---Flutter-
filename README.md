hms/
├── android/
├── ios/
├── web/
├── windows/
├── linux/
├── macos/
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── main_dashboard.dart          # UPDATED: With 11 modules
│   │   ├── login_screen.dart            # NEW: Common login screen
│   │   ├── splash_screen.dart
│   │   ├── reception/
            opd_components/
               ├── new_opd_appointment_screen.dart
               ├── opd_patient_registration.dart
               ├── patient_history_screen.dart
               ├── prescription_screen.dart
               ├── opd_billing_screen.dart
               └── opd_patient_details.dart
│   │   │   ├── reception_dashboard.dart
│   │   │   ├── patient_registration.dart
│   │   │   ├── existing_patient.dart
│   │   │   ├── admission_requests.dart
│   │   │   └── billing.dart
│   │   ├── doctor/
│   │   │   ├── doctor_dashboard.dart          # Main dashboard with exact design
│   │   │   ├── opd_ipd_appointments.dart      # OPD/IPD Appointments
│   │   │   ├── e_prescriptions.dart           # E-Prescriptions
│   │   │   ├── patient_history.dart           # Patient History
│   │   │   ├── lab_test_request.dart          # Lab Test Request
│   │   │   ├── telecommunication.dart         # Telecommunication
│   │   │   ├── ipd_management.dart            # IPD Management
│   │   │   └── discharge_summary.dart         # Discharge Summary
│   │   pharmacy/
│   │   ├── pharmacy_dashboard.dart        # Main dashboard (updated)
│   │   ├── pharmacy_components/          # Pharmacy components folder
│   │   │   ├── prescription_processing.dart
│   │   │   ├── medicine_inventory.dart
│   │   │   ├── batch_expiry_alerts.dart
│   │   │   ├── opd_ipd_sales.dart
│   │   │   ├── pharmacy_billing.dart
│   │   │   ├── consumption_history.dart
│   │   │   ├── admin_profile.dart
│   │   │   └── pharmacy_settings.dart
│   │   ├── laboratory/
│   │   │   └── lab_dashboard.dart
│   │   ├──  nurse/
│   │   │   ├── nurse_dashboard.dart          # Main nurse dashboard
│   │   │   ├── inbox_screen.dart             # Inbox
│   │   │   ├── treatment_plans_screen.dart    # Treatment Plans
│   │   │   ├── patient_followup_screen.dart   # Patient Follow-up
│   │   │   ├── vitals_monitoring_screen.dart  # Vitals Monitoring
│   │   │   ├── iv_fluid_alerts_screen.dart    # IV Fluid Alerts
│   │   │   ├── medications_procedures_screen.dart # Medications & Procedures
│   │   │   ├── ipd_pharmacy_orders_screen.dart # IPD Pharmacy Orders
│   │   │   ├── geo_attendance_screen.dart      # Geo Attendance
│   │   │   ├── admin_profile_screen.dart       # Admin Profile
│   │   │   └── settings_screen.dart           # Settings
│   │   ├── patient/
│   │   │   ├── patient_dashboard.dart          # UPDATED: Main patient dashboard
│   │   │   ├── patient_appointments.dart       # NEW: Online appointments
│   │   │   ├── teleconsultation.dart           # NEW: Video consultations
│   │   │   ├── lab_results.dart                # NEW: Lab results viewer
│   │   │   ├── e_prescriptions.dart            # NEW: Prescriptions viewer
│   │   │   ├── bills_payments.dart             # NEW: Billing management
│   │   │   ├── health_reminders.dart           # NEW: Health reminders
│   │   │   ├── emergency_sos.dart              # NEW: Emergency SOS
│   │   │   ├── admin_profile.dart              # NEW: Patient profile
│   │   │   └── patient_settings.dart           # NEW: Settings
│   │   ├── admin/                      # NEW FOLDER
│   │   │   └── admin_dashboard.dart    # NEW
│   │   ├── insurance/                  # NEW FOLDER
│   │   │   └── insurance_dashboard.dart # NEW
│   │   ├── diagnostics/
│   │   ├── diagnostics_dashboard.dart        # Main dashboard (updated)
│   │   ├── diagnostics_components/           # Diagnostics components folder
│   │   │   ├── radiology_test_orders.dart
│   │   │   ├── report_uploads.dart
│   │   │   ├── dicom_viewer.dart
│   │   │   ├── admin_profile.dart
│   │   │   └── diagnostics_settings.dart
│   │   └── dialysis/
│   │   ├── dialysis_dashboard.dart        # Main dashboard (updated)
│   │   ├── dialysis_components/           # Dialysis components folder
│   │   │   ├── session_tracking.dart
│   │   │   ├── fluid_management.dart
│   │   │   ├── consumables.dart
│   │   │   ├── dialysis_billing.dart
│   │   │   ├── admin_profile.dart
│   │   │   └── dialysis_settings.dart
│   ├── models/
│   │   ├── patient_model.dart
│   │   ├── doctor_model.dart
│   │   ├── appointment_model.dart
│   │   ├── billing_model.dart
│   │   └── lab_model.dart
│   ├── widgets/
│   │   ├── stat_card.dart
│   │   ├── quick_action_button.dart
│   │   ├── dashboard_card.dart
│   │   ├── patient_card.dart
│   │   └── billing_item.dart
│   ├── utils/
│   │   ├── constants.dart
│   │   ├── colors.dart
│   │   ├── validators.dart
│   │   └── helpers.dart
│   └── services/
│       ├── api_service.dart
│       ├── database_service.dart
│       └── auth_service.dart          # NEW: Authentication service
├── assets/
│   ├── images/
│   │   ├── app_logo.png
│   │   └── hospital_bg.jpg
│   └── fonts/
├── test/
├── pubspec.yaml
├── README.md
└── .gitignore





//stful → StatefulWidget boilerplate
//stless → StatelessWidget boilerplate

🚀 Features
Main Dashboard
Modern, responsive UI based on provided design

Module-wise access cards

System status display

Today's quote section

Feature highlights

Reception Module
Patient Registration: New and existing patient registration

Patient Search: Search by name, phone, or patient ID

Admission Management: Process doctor admission requests

Billing System: Handle deposits, payments, and refunds

Statistics Dashboard: Real-time patient statistics

Bed Management: Ward and bed assignment

Doctor Module (Placeholder)
OPD/IPD patient management

Prescription generation

Lab test ordering

Patient admission initiation

Daily progress notes

Pharmacy Module (Placeholder)
Medicine inventory management

Prescription fulfillment

Stock management

Billing integration

Laboratory Module (Placeholder)
Lab test management

Report generation and upload

Result tracking

Integration with doctor module

🎨 Design System
Color Palette
Primary: #2D3748 (Dark blue)

Secondary: #4299E1 (Blue)

Success: #48BB78 (Green)

Warning: #ED8936 (Orange)

Danger: #F56565 (Red)

Background: #F7FAFC (Light gray)

Typography
Primary Font: Inter

Headings: 24px, 20px, 18px

Body: 16px, 14px, 12px

Colors: #2D3748, #4A5568, #718096

📱 Screens
1. Splash Screen
Brand logo display

Loading animation

2-second duration before main dashboard

2. Main Dashboard
Application modules grid

System status bar

Date and time display

Feature cards with icons

Today's quote section

3. Reception Dashboard
Patient statistics cards

Quick action buttons

IPD vs OPD ratio chart

Recent activity feed

Bottom navigation bar

4. Patient Registration
Form for new patient registration

Required fields validation

Doctor assignment

Patient type selection (OPD/IPD)

Automatic patient ID generation

5. Existing Patient Search
Search by name, phone, or ID

Patient list with details

Quick actions (View, Edit, Continue Visit)

Recent patients table

6. Admission Requests
List of admission requests from doctors

Request details view

Bed and ward assignment

Deposit receipt generation

Available beds dashboard

7. Billing & Payments
Patient selection

Charges breakdown

Deposit management

Payment receipt generation

Refund processing

Transaction history

🛠️ Installation & Setup
Prerequisites
Flutter SDK 3.0.0 or higher

Dart SDK 2.19.0 or higher

Android Studio / VS Code

Android Emulator or Physical Device






10. Useful Development Commands
bash
# Check Flutter doctor
flutter doctor

# Analyze code
flutter analyze

# Format code
flutter format .

# Run tests
flutter test

# Generate app icons
flutter pub run flutter_launcher_icons:main

# Clean build
flutter clean

# Get packages
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Show device list
flutter devices

# Create platform-specific files
flutter create .

# Generate localization files
flutter gen-l10n

# Build app bundle for Play Store
flutter build appbundle

# Build IPA for App Store
flutter build ipa






9. Build the Project
bash
# Build for Android
flutter build apk

# Build for iOS
flutter build ios

# Build for Web
flutter build web

# Build for Desktop (Windows)
flutter build windows

# Build for Desktop (Linux)
flutter build linux

# Build for Desktop (macOS)
flutter build macos