import 'package:flutter/material.dart';
import 'package:hms/screens/main_dashboard.dart';
import 'package:hms/screens/doctor/opd_ipd_appointments.dart';
import 'package:hms/screens/doctor/e_prescriptions.dart';
import 'package:hms/screens/doctor/patient_history.dart';
import 'package:hms/screens/doctor/lab_test_request.dart';
import 'package:hms/screens/doctor/telecommunication.dart';
import 'package:hms/screens/doctor/ipd_management.dart';
import 'package:hms/screens/doctor/discharge_summary.dart';
import 'package:hms/screens/doctor/doctor_settings.dart';
import 'package:hms/screens/doctor/doctor_profile.dart';
import 'package:hms/screens/doctor/add_appointment.dart';
import 'package:hms/screens/doctor/doctor_inbox.dart';
import 'package:hms/utils/constants.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  String _selectedNavItem = 'Dashboard';
  bool _showProfileMenu = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: Row(
        children: [
          // Left Navigation Panel - Fixed width for desktop
          if (!isMobile)
            Container(
              width: 280,
              color: Colors.white,
              child: _buildSidebar(),
            ),

          // Main Content Area
          Expanded(
            child: Container(
              color: const Color(0xFFF7FAFC),
              child: Column(
                children: [
                  // Top Bar - Only for Dashboard screen
                  if (_selectedNavItem == 'Dashboard')
                    Container(
                      height: 70,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // For mobile, show hamburger menu
                          if (isMobile)
                            IconButton(
                              icon: const Icon(Icons.menu,
                                  color: Color(0xFF2383E2)),
                              onPressed: () {
                                _showMobileSidebar(context);
                              },
                            ),

                          // Greeting and date - Only for Dashboard
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Good morning, Dr. Sharma',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2D3748),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Today 24 Dec., Monday',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF718096),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (!isMobile) const SizedBox(width: 16),

                          // Add appointment button - Only for Dashboard
                          if (!isMobile && _selectedNavItem == 'Dashboard')
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddAppointment()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2383E2),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                                minimumSize: const Size(0, 40),
                              ),
                              icon: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Add appointment',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                  // Divider - Only for Dashboard
                  if (_selectedNavItem == 'Dashboard')
                    Container(height: 1, color: const Color(0xFFE2E8F0)),

                  // Main Content
                  Expanded(
                    child: _buildSelectedContent(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Column(
      children: [
        // Scrollable content area
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Logo
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2383E2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.medical_services,
                            color: Colors.white, size: 24),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'DocNex',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Home Section
                _buildSidebarItem('Home', Icons.home_outlined),
                _buildSidebarItem('Inbox', Icons.email_outlined),

                const SizedBox(height: 30),

                // Dashboard Section Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Admin / Dashboard',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFA0AEC0),
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSidebarItem('Dashboard', Icons.dashboard_outlined),

                const SizedBox(height: 30),

                // INSTANT CARE Section Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'INSTANT CARE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFA0AEC0),
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSidebarItem(
                    'OPD / IPD Appointments', Icons.event_note_outlined),
                _buildSidebarItem(
                    'Telecommunication', Icons.video_call_outlined),

                const SizedBox(height: 30),

                // CLINICAL RECORDS Section Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'CLINICAL RECORDS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFA0AEC0),
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSidebarItem(
                    'E-Prescriptions', Icons.description_outlined),
                _buildSidebarItem('Lab Test Request', Icons.science_outlined),
                _buildSidebarItem('Patient History', Icons.history_outlined),

                const SizedBox(height: 30),

                // PATIENT MANAGEMENT Section Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'PATIENT MANAGEMENT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFA0AEC0),
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSidebarItem(
                    'IPD Management', Icons.local_hospital_outlined),
                _buildSidebarItem(
                    'Discharge Summary', Icons.exit_to_app_outlined),
                _buildSidebarItem('Doctor profile', Icons.person_outlined),
                _buildSidebarItem('Setting', Icons.settings_outlined),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),

        // Bottom Profile Section - Fixed at bottom
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade200),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              // Doctor Profile
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2383E2).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF2383E2),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dr. Mann Sharma',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Cardiologist',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showProfileMenu = !_showProfileMenu;
                      });
                    },
                    child: Icon(
                      _showProfileMenu ? Icons.expand_less : Icons.expand_more,
                      color: Colors.grey.shade600,
                      size: 24,
                    ),
                  ),
                ],
              ),

              // Logout Menu
              if (_showProfileMenu)
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainDashboard()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.logout,
                              color: Colors.grey.shade600, size: 22),
                          const SizedBox(width: 15),
                          const Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF2D3748),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSidebarItem(String title, IconData icon) {
    final isSelected = _selectedNavItem == title;
    return InkWell(
      onTap: () {
        if (title == 'Home') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainDashboard()),
          );
        } else {
          setState(() {
            _selectedNavItem = title;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2383E2) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : const Color(0xFF718096),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : const Color(0xFF4A5568),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    // Return the selected screen content
    switch (_selectedNavItem) {
      case 'Dashboard':
        return _buildDashboardContent();
      case 'Inbox':
        return const DoctorInbox();
      case 'OPD / IPD Appointments':
        return OpdIpdAppointments();
      case 'Telecommunication':
        return Telecommunication();
      case 'E-Prescriptions':
        return EPrescriptions();
      case 'Lab Test Request':
        return LabTestRequest();
      case 'Patient History':
        return PatientHistory();
      case 'IPD Management':
        return IpdManagement();
      case 'Discharge Summary':
        return DischargeSummary();
      case 'Doctor profile':
        return DoctorProfile();
      case 'Setting':
        return DoctorSettings();
      default:
        return _buildDashboardContent();
    }
  }

  Widget _buildDashboardContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header - Only for Dashboard
          const Text(
            'DOCTOR PANEL >> Dashboard',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF718096),
            ),
          ),
          const SizedBox(height: 20),

          // Stats Cards Row
          _buildStatsCards(isMobile),

          const SizedBox(height: 20),

          // Main Content Row
          if (!isMobile)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Today's Schedule
                Expanded(
                  flex: 5,
                  child: _buildTodaysSchedule(),
                ),

                const SizedBox(width: 20),

                // Recent Patients and Quick Actions
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _buildRecentPatients(),
                      const SizedBox(height: 20),
                      _buildQuickActions(),
                    ],
                  ),
                ),

                const SizedBox(width: 20),

                // Right column widgets
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _buildIPDVitalsMonitor(),
                      const SizedBox(height: 20),
                      _buildPendingTasks(),
                      const SizedBox(height: 20),
                      _buildTeleconsultationQueue(),
                    ],
                  ),
                ),
              ],
            ),

          // Mobile Layout
          if (isMobile)
            Column(
              children: [
                _buildTodaysSchedule(),
                const SizedBox(height: 20),
                _buildRecentPatients(),
                const SizedBox(height: 20),
                _buildQuickActions(),
                const SizedBox(height: 20),
                _buildIPDVitalsMonitor(),
                const SizedBox(height: 20),
                _buildPendingTasks(),
                const SizedBox(height: 20),
                _buildTeleconsultationQueue(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildStatsCards(bool isMobile) {
    final statsData = [
      {
        'title': 'Today\'s Appointments',
        'value': '24',
        'icon': Icons.calendar_today_outlined,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF59BDFF), Color(0xFFF1FAFF)],
        ),
      },
      {
        'title': 'Pending Lab Reports',
        'value': '24',
        'icon': Icons.science_outlined,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF57E3D8), Color(0xFFE3FCFA)],
        ),
      },
      {
        'title': 'Active IPD patients',
        'value': '24',
        'icon': Icons.local_hospital_outlined,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF50FFFF), Color(0xFFDFFFFF)],
        ),
      },
      {
        'title': 'Teleconsultation',
        'value': '24',
        'icon': Icons.video_call_outlined,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF68EF77), Color(0xFFECFEEE)],
        ),
      },
    ];

    if (isMobile) {
      return Column(
        children: statsData.map((stat) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: _buildStatCard(
              title: stat['title'] as String,
              value: stat['value'] as String,
              icon: stat['icon'] as IconData,
              gradient: stat['gradient'] as Gradient,
            ),
          );
        }).toList(),
      );
    }

    return Row(
      children: statsData.map((stat) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: _buildStatCard(
              title: stat['title'] as String,
              value: stat['value'] as String,
              icon: stat['icon'] as IconData,
              gradient: stat['gradient'] as Gradient,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Gradient gradient,
  }) {
    return GestureDetector(
      onTap: () {
        if (title.contains('Appointments')) {
          setState(() {
            _selectedNavItem = 'OPD / IPD Appointments';
          });
        } else if (title.contains('Lab Reports')) {
          setState(() {
            _selectedNavItem = 'Lab Test Request';
          });
        } else if (title.contains('IPD patients')) {
          setState(() {
            _selectedNavItem = 'IPD Management';
          });
        } else if (title.contains('Teleconsultation')) {
          setState(() {
            _selectedNavItem = 'Telecommunication';
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                Icon(Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.8), size: 14),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaysSchedule() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  "Today's Schedule",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedNavItem = 'OPD / IPD Appointments';
                  });
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2383E2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Schedule Items
          ..._buildScheduleItems(),

          const SizedBox(height: 20),

          // AI RMO Assistant Section
          GestureDetector(
            onTap: () {
              _showVoiceAssistant();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28),
              decoration: BoxDecoration(
                color: const Color(0xFF2383E2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // First row: AI RMO Assistant text
                  const Text(
                    'AI RMO Assistant',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Second row: Mic icon only
                  const Icon(
                    Icons.mic_none_rounded,
                    size: 50,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 12),

                  // Third row: "TAP to start voice entry" text
                  const Text(
                    'TAP to start voice entry',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildScheduleItems() {
    final scheduleItems = [
      _buildScheduleItem('Mann Sharma', '9.00 A.M.', 'OPD', 'Confirmed'),
      _buildScheduleItem('Mann Sharma', '9.00 A.M.', 'Follow-up', 'Confirmed'),
      _buildScheduleItem('Mann Sharma', '9.00 A.M.', 'OPD', 'Confirmed'),
      _buildScheduleItem(
          'Mann Sharma', '9.00 A.M.', 'Teleconsultation', 'Confirmed'),
      _buildScheduleItem('Mann Sharma', '9.00 A.M.', 'OPD', 'Confirmed'),
      _buildScheduleItem('Mann Sharma', '9.00 A.M.', 'IPD Review', 'Confirmed'),
    ];

    return scheduleItems;
  }

  Widget _buildScheduleItem(
      String patient, String time, String type, String status) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNavItem = 'OPD / IPD Appointments';
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF7FAFC),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF2383E2).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  Icon(Icons.person, color: const Color(0xFF2383E2), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$time • $type',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF718096),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 70),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: _getStatusColor(status).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 11,
                  color: _getStatusColor(status),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentPatients() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Recent Patients',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedNavItem = 'Patient History';
                  });
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2383E2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Recent Patients List
          Column(
            children: [
              _buildRecentPatientItem(
                  'Mann Sharma', 'Hypertension', 'Stable', '2 days ago'),
              _buildRecentPatientItem(
                  'Mann Sharma', 'Hypertension', 'Stable', '2 days ago'),
              _buildRecentPatientItem(
                  'Mann Sharma', 'Hypertension', 'Stable', '2 days ago'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentPatientItem(
      String name, String condition, String status, String time) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNavItem = 'Patient History';
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF7FAFC),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFF2383E2).withOpacity(0.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child:
                  const Icon(Icons.person, color: Color(0xFF2383E2), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    condition,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF718096),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF38A169).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF38A169),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFA0AEC0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 16),

          // First row of quick actions
          Row(
            children: [
              Expanded(
                child: _buildQuickActionButton(
                  icon: Icons.add,
                  label: 'Add appointment',
                  color: const Color(0xFF2383E2),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddAppointment()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildQuickActionButton(
                  icon: Icons.description_outlined,
                  label: 'Lab request',
                  color: const Color(0xFF48BB78),
                  onPressed: () {
                    setState(() {
                      _selectedNavItem = 'Lab Test Request';
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Second row of quick actions
          Row(
            children: [
              Expanded(
                child: _buildQuickActionButton(
                  icon: Icons.local_hospital_outlined,
                  label: 'IPD management',
                  color: const Color(0xFFED8936),
                  onPressed: () {
                    setState(() {
                      _selectedNavItem = 'IPD Management';
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildQuickActionButton(
                  icon: Icons.medical_services_outlined,
                  label: 'E-Prescription',
                  color: const Color(0xFF9F7AEA),
                  onPressed: () {
                    setState(() {
                      _selectedNavItem = 'E-Prescriptions';
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIPDVitalsMonitor() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'IPD Vitals Monitor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedNavItem = 'IPD Management';
                  });
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2383E2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              _buildVitalItem('Room 101', 'Bed no. - 80/180', 'Temp: 98.6°F',
                  'Pulse: 80', 'SpO₂: 98%'),
              _buildVitalItem('Room 102', 'Bed no. - 80/180', 'Temp: 98.6°F',
                  'Pulse: 80', 'SpO₂: 98%'),
              _buildVitalItem('Room 103', 'Bed no. - 80/180', 'Temp: 98.6°F',
                  'Pulse: 80', 'SpO₂: 98%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVitalItem(
      String room, String bed, String temp, String pulse, String spo2) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNavItem = 'IPD Management';
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF7FAFC),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              room,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              bed,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF718096),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    temp,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF2D3748),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    pulse,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF2D3748),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    spo2,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF2D3748),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingTasks() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pending Tasks',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              _buildPendingTaskItem(
                  'Review lab results for John Smith', 'High', '2 days ago'),
              _buildPendingTaskItem('Complete discharge summary for Room 205',
                  'Medium', '2 days ago'),
              _buildPendingTaskItem('Approve prescription for Sarah Johnson',
                  'Low', '2 days ago'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPendingTaskItem(String task, String priority, String time) {
    Color priorityColor;
    switch (priority.toLowerCase()) {
      case 'high':
        priorityColor = const Color(0xFFF56565);
        break;
      case 'medium':
        priorityColor = const Color(0xFFED8936);
        break;
      case 'low':
        priorityColor = const Color(0xFF48BB78);
        break;
      default:
        priorityColor = const Color(0xFF718096);
    }

    return GestureDetector(
      onTap: () {
        if (task.contains('lab results')) {
          setState(() {
            _selectedNavItem = 'Lab Test Request';
          });
        } else if (task.contains('discharge summary')) {
          setState(() {
            _selectedNavItem = 'Discharge Summary';
          });
        } else if (task.contains('prescription')) {
          setState(() {
            _selectedNavItem = 'E-Prescriptions';
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF2D3748),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF718096),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              constraints: const BoxConstraints(minWidth: 60),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: priorityColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                priority,
                style: TextStyle(
                  fontSize: 11,
                  color: priorityColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeleconsultationQueue() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Teleconsultation Queue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedNavItem = 'Telecommunication';
                  });
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2383E2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedNavItem = 'Telecommunication';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF7FAFC),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2383E2).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.person,
                        color: Color(0xFF2383E2), size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mann Sharma',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Waiting: 5 min',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF718096),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedNavItem = 'Telecommunication';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2383E2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      minimumSize: const Size(0, 36),
                    ),
                    child: const Text(
                      'Join',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return const Color(0xFF38A169);
      case 'pending':
        return const Color(0xFFED8936);
      case 'cancelled':
        return const Color(0xFFF56565);
      default:
        return const Color(0xFF718096);
    }
  }

  void _showMobileSidebar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: _buildSidebar(),
        );
      },
    );
  }

  void _showVoiceAssistant() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AI RMO Assistant'),
        content: const Text(
            'Voice assistant functionality will be implemented here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
