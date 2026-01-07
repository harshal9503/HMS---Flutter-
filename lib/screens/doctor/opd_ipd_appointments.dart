import 'package:flutter/material.dart';
import 'package:hms/screens/doctor/doctor_dashboard.dart';
import 'package:hms/utils/constants.dart';

class OpdIpdAppointments extends StatefulWidget {
  const OpdIpdAppointments({super.key});

  @override
  State<OpdIpdAppointments> createState() => _OpdIpdAppointmentsState();
}

class _OpdIpdAppointmentsState extends State<OpdIpdAppointments> {
  String _selectedFilter = 'Today appointment (5)';
  bool _showAddAppointmentForm = false;

  // Form controllers for Add Appointment
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _appointmentTimeController =
      TextEditingController();
  final TextEditingController _conditionController = TextEditingController();
  String _selectedAppointmentType = 'OPD';
  String _selectedStatus = 'Confirmed';

  // Sample appointment data for Today
  final List<Map<String, dynamic>> _todayAppointments = [
    {
      'time': '9.00 a.m.',
      'patient': 'John Smith',
      'type': 'OPD',
      'condition': 'Chest pain',
      'status': 'Confirmed',
    },
    {
      'time': '10.30 a.m.',
      'patient': 'Emily Davis',
      'type': 'Telecommunication',
      'condition': 'Hypertension',
      'status': 'Confirmed',
    },
    {
      'time': '11.15 a.m.',
      'patient': 'Robert Johnson',
      'type': 'OPD',
      'condition': 'Diabetes checkup',
      'status': 'Walking',
    },
    {
      'time': '2.00 p.m.',
      'patient': 'Sarah Wilson',
      'type': 'IPD',
      'condition': 'Fever & Cough',
      'status': 'Confirmed',
    },
    {
      'time': '4.30 p.m.',
      'patient': 'Michael Brown',
      'type': 'OPD',
      'condition': 'Back pain',
      'status': 'Confirmed',
    },
  ];

  // Sample appointment data for Upcoming
  final List<Map<String, dynamic>> _upcomingAppointments = [
    {
      'time': '9.00 a.m.',
      'patient': 'David Miller',
      'type': 'OPD',
      'condition': 'Headache',
      'status': 'Scheduled',
    },
    {
      'time': '10.00 a.m.',
      'patient': 'Lisa Taylor',
      'type': 'Telecommunication',
      'condition': 'Post-op followup',
      'status': 'Scheduled',
    },
    {
      'time': '11.30 a.m.',
      'patient': 'James Wilson',
      'type': 'OPD',
      'condition': 'Blood pressure',
      'status': 'Pending',
    },
    {
      'time': '3.00 p.m.',
      'patient': 'Patricia Lee',
      'type': 'IPD',
      'condition': 'Heart checkup',
      'status': 'Scheduled',
    },
    {
      'time': '5.00 p.m.',
      'patient': 'Thomas Clark',
      'type': 'OPD',
      'condition': 'Annual physical',
      'status': 'Scheduled',
    },
  ];

  List<Map<String, dynamic>> get _currentAppointments {
    return _selectedFilter == 'Today appointment (5)'
        ? _todayAppointments
        : _upcomingAppointments;
  }

  @override
  void dispose() {
    _patientNameController.dispose();
    _appointmentTimeController.dispose();
    _conditionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar - AppBar style
            Container(
              height: 70,
              color: const Color(0xFF2383E2),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 8
                    : isTablet
                        ? 16
                        : 20,
              ),
              child: Row(
                children: [
                  // Back Button
                  Container(
                    width: 50,
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 24),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DoctorDashboard()),
                        );
                      },
                    ),
                  ),

                  // Title
                  const Expanded(
                    child: Text(
                      'OPD/IPD Appointments',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Voice assistance pill (only for desktop)
                  if (!isMobile && !isTablet)
                    Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(999),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.mic_none_rounded,
                              size: 18,
                              color: Color(0xFF2383E2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Voice assistance',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Main Content Area
            Expanded(
              child: _showAddAppointmentForm
                  ? _buildAddAppointmentForm(isMobile, isTablet)
                  : _buildMainContent(isMobile, isTablet),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(bool isMobile, bool isTablet) {
    return Container(
      color: const Color(0xFFF7FAFC),
      child: Column(
        children: [
          // Greeting and date section
          Container(
            height: 70,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 16
                  : isTablet
                      ? 24
                      : 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Greeting and date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Good morning, Dr. Anderson',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D3748),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Today 24 Dec., Monday',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: const Color(0xFF718096),
                        ),
                      ),
                    ],
                  ),
                ),

                // Add appointment button (only on desktop/tablet)
                if (!isMobile)
                  Container(
                    height: 44,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showAddAppointmentForm = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2383E2),
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 16 : 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Add appointment',
                        style: TextStyle(
                          fontSize: isTablet ? 13 : 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Divider
          Container(height: 1, color: const Color(0xFFE2E8F0)),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(
                  isMobile
                      ? 16
                      : isTablet
                          ? 20
                          : 24,
                ),
                child: _buildContent(isMobile, isTablet),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with breadcrumb and buttons
        if (!isMobile)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'DOCTOR PANEL >> OPD/IPD Appointments',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF718096),
                ),
              ),

              // Overview and View Analysis buttons (desktop/tablet)
              Row(
                children: [
                  // Overview Button
                  Container(
                    height: 36,
                    margin: const EdgeInsets.only(right: 8),
                    child: ElevatedButton.icon(
                      onPressed: _showOverview,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2383E2),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(
                        Icons.assessment_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // View Analysis Button
                  Container(
                    height: 36,
                    child: OutlinedButton.icon(
                      onPressed: _showViewAnalysis,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE2E8F0)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      icon: const Icon(
                        Icons.analytics_outlined,
                        size: 16,
                        color: Color(0xFF4A5568),
                      ),
                      label: const Text(
                        'View Analysis',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4A5568),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        if (isMobile) ...[
          // Mobile header
          const Text(
            'OPD/IPD Appointments',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF718096),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Overview Button for mobile
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: ElevatedButton.icon(
                    onPressed: _showOverview,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2383E2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(
                      Icons.assessment_outlined,
                      size: 14,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // View Analysis Button for mobile
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: OutlinedButton.icon(
                    onPressed: _showViewAnalysis,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE2E8F0)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    icon: const Icon(
                      Icons.analytics_outlined,
                      size: 14,
                      color: Color(0xFF4A5568),
                    ),
                    label: const Text(
                      'View Analysis',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4A5568),
                      ),
                    ),
                  ),
                ),
              ),

              // Add appointment button for mobile
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _showAddAppointmentForm = true;
                    });
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFF2383E2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  icon: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],

        const SizedBox(height: 20),

        // STATS CARDS SECTION
        _buildStatsCards(isMobile, isTablet),

        const SizedBox(height: 20),

        // Appointment Management Section
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 16 : 20),
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
              Text(
                'Appointment Management',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 16),

              // Filter Tabs
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7FAFC),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    _buildFilterTab('Today appointment (5)',
                        _selectedFilter == 'Today appointment (5)'),
                    _buildFilterTab('Upcoming appointment (5)',
                        _selectedFilter == 'Upcoming appointment (5)'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Appointments List/Table
              if (isMobile)
                _buildMobileAppointmentsList()
              else
                _buildDesktopAppointmentsTable(isTablet),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCards(bool isMobile, bool isTablet) {
    final statsData = [
      {
        'title': 'Today Appointments',
        'value': '30',
        'icon': Icons.calendar_today_outlined,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF59BDFF), Color(0xFFF1FAFF)],
        ),
      },
      {
        'title': 'Total OPD patients',
        'value': '24',
        'icon': Icons.people_outline,
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
              isMobile: true,
            ),
          );
        }).toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 2 : 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: isTablet ? 1.8 : 2.0,
      ),
      itemCount: statsData.length,
      itemBuilder: (context, index) {
        final stat = statsData[index];
        return _buildStatCard(
          title: stat['title'] as String,
          value: stat['value'] as String,
          icon: stat['icon'] as IconData,
          gradient: stat['gradient'] as Gradient,
          isMobile: false,
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Gradient gradient,
    required bool isMobile,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigation logic here if needed
      },
      child: Container(
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: isMobile ? 32 : 36,
                  height: isMobile ? 32 : 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      Icon(icon, color: Colors.white, size: isMobile ? 16 : 20),
                ),
                Icon(Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.8),
                    size: isMobile ? 12 : 14),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAppointmentForm(bool isMobile, bool isTablet) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Form header
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF2383E2)),
                onPressed: () {
                  setState(() {
                    _showAddAppointmentForm = false;
                    _clearForm();
                  });
                },
              ),
              const SizedBox(width: 12),
              Text(
                'Add New Appointment',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D3748),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Container(
            padding: EdgeInsets.all(isMobile ? 16 : 20),
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
                // Patient Name
                _buildFormField(
                  'Patient Name',
                  'Enter patient name',
                  _patientNameController,
                  isMobile: isMobile,
                ),
                const SizedBox(height: 16),

                // Appointment Time
                _buildFormField(
                  'Appointment Time',
                  'e.g., 9.00 a.m.',
                  _appointmentTimeController,
                  isMobile: isMobile,
                ),
                const SizedBox(height: 16),

                // Appointment Type
                Text(
                  'Appointment Type',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4A5568),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildTypeChip('OPD', Icons.event_note_outlined, isMobile),
                    _buildTypeChip('Telecommunication',
                        Icons.video_call_outlined, isMobile),
                    _buildTypeChip(
                        'IPD', Icons.local_hospital_outlined, isMobile),
                  ],
                ),
                const SizedBox(height: 16),

                // Condition
                _buildFormField(
                  'Condition/Reason',
                  'Enter condition or reason for appointment',
                  _conditionController,
                  maxLines: 2,
                  isMobile: isMobile,
                ),
                const SizedBox(height: 16),

                // Status
                Text(
                  'Status',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4A5568),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildStatusChip(
                        'Confirmed', Icons.check_circle_outline, isMobile),
                    _buildStatusChip(
                        'Walking', Icons.directions_walk, isMobile),
                    _buildStatusChip('Scheduled', Icons.schedule, isMobile),
                    _buildStatusChip('Pending', Icons.pending, isMobile),
                  ],
                ),
                const SizedBox(height: 24),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _showAddAppointmentForm = false;
                            _clearForm();
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: isMobile ? 8 : 10),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 13,
                            color: const Color(0xFF718096),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _addAppointment,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2383E2),
                          padding:
                              EdgeInsets.symmetric(vertical: isMobile ? 8 : 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'Add Appointment',
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
    String label,
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 12 : 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4A5568),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFF2383E2)),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: isMobile ? 8 : 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTypeChip(String type, IconData icon, bool isMobile) {
    final isSelected = _selectedAppointmentType == type;
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: isMobile ? 12 : 14,
              color: isSelected ? Colors.white : const Color(0xFF2383E2)),
          const SizedBox(width: 4),
          Text(type, style: TextStyle(fontSize: isMobile ? 10 : 11)),
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedAppointmentType = type;
        });
      },
      selectedColor: const Color(0xFF2383E2),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? const Color(0xFF2383E2) : const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : const Color(0xFF2D3748),
        fontSize: isMobile ? 10 : 11,
        fontWeight: FontWeight.w500,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 10,
        vertical: isMobile ? 3 : 4,
      ),
    );
  }

  Widget _buildStatusChip(String status, IconData icon, bool isMobile) {
    final isSelected = _selectedStatus == status;
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: isMobile ? 12 : 14,
              color: isSelected ? Colors.white : _getStatusColor(status)),
          const SizedBox(width: 4),
          Text(status, style: TextStyle(fontSize: isMobile ? 10 : 11)),
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedStatus = status;
        });
      },
      selectedColor: _getStatusColor(status),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? _getStatusColor(status) : const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : _getStatusColor(status),
        fontSize: isMobile ? 10 : 11,
        fontWeight: FontWeight.w500,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 10,
        vertical: isMobile ? 3 : 4,
      ),
    );
  }

  Widget _buildFilterTab(String title, bool isActive) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedFilter = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF2383E2) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : const Color(0xFF718096),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopAppointmentsTable(bool isTablet) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width - 48,
        ),
        child: DataTable(
          columnSpacing: isTablet ? 16.0 : 24.0,
          headingRowHeight: 50,
          headingRowColor: MaterialStateProperty.all(const Color(0xFFF7FAFC)),
          headingTextStyle: TextStyle(
            fontSize: isTablet ? 11 : 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4A5568),
          ),
          dataRowHeight: 60,
          columns: [
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 60 : 80, child: const Text('Time'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 100 : 120, child: const Text('Patient'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 80 : 100, child: const Text('Type'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 100 : 120,
                    child: const Text('Condition'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 80 : 100, child: const Text('Status'))),
            DataColumn(
                label: SizedBox(
                    width: isTablet ? 180 : 200, child: const Text('Action'))),
          ],
          rows: _currentAppointments.map((appointment) {
            return DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: isTablet ? 60 : 80,
                    child: Text(
                      appointment['time'],
                      style: TextStyle(
                        fontSize: isTablet ? 11 : 12,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 100 : 120,
                    child: Text(
                      appointment['patient'],
                      style: TextStyle(
                        fontSize: isTablet ? 11 : 12,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 80 : 100,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                            _getTypeColor(appointment['type']).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        appointment['type'],
                        style: TextStyle(
                          fontSize: isTablet ? 9 : 10,
                          color: _getTypeColor(appointment['type']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 100 : 120,
                    child: Text(
                      appointment['condition'],
                      style: TextStyle(
                        fontSize: isTablet ? 11 : 12,
                        color: const Color(0xFF718096),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 80 : 100,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(appointment['status'])
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        appointment['status'],
                        style: TextStyle(
                          fontSize: isTablet ? 9 : 10,
                          color: _getStatusColor(appointment['status']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: isTablet ? 180 : 200,
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        // View Button
                        SizedBox(
                          height: 28,
                          child: OutlinedButton.icon(
                            onPressed: () => _viewAppointment(appointment),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              side: const BorderSide(color: Color(0xFF38A169)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            icon: Icon(
                              Icons.visibility,
                              size: isTablet ? 11 : 12,
                              color: const Color(0xFF38A169),
                            ),
                            label: Text(
                              'View',
                              style: TextStyle(
                                fontSize: isTablet ? 10 : 11,
                                color: const Color(0xFF38A169),
                              ),
                            ),
                          ),
                        ),

                        // Edit Button
                        SizedBox(
                          height: 28,
                          child: OutlinedButton.icon(
                            onPressed: () => _editAppointment(appointment),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              side: const BorderSide(color: Color(0xFF2383E2)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            icon: Icon(
                              Icons.edit,
                              size: isTablet ? 11 : 12,
                              color: const Color(0xFF2383E2),
                            ),
                            label: Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: isTablet ? 10 : 11,
                                color: const Color(0xFF2383E2),
                              ),
                            ),
                          ),
                        ),

                        // Call Button
                        SizedBox(
                          height: 28,
                          child: OutlinedButton.icon(
                            onPressed: () => _callPatient(appointment),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              side: const BorderSide(color: Color(0xFFED8936)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            icon: Icon(
                              Icons.call,
                              size: isTablet ? 11 : 12,
                              color: const Color(0xFFED8936),
                            ),
                            label: Text(
                              'Call',
                              style: TextStyle(
                                fontSize: isTablet ? 10 : 11,
                                color: const Color(0xFFED8936),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMobileAppointmentsList() {
    return Column(
      children: _currentAppointments.map((appointment) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF7FAFC),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    appointment['time'],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(appointment['status'])
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      appointment['status'],
                      style: TextStyle(
                        fontSize: 10,
                        color: _getStatusColor(appointment['status']),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment['patient'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          appointment['condition'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF718096),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          _getTypeColor(appointment['type']).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      appointment['type'],
                      style: TextStyle(
                        fontSize: 10,
                        color: _getTypeColor(appointment['type']),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  // View Button
                  SizedBox(
                    height: 28,
                    child: OutlinedButton.icon(
                      onPressed: () => _viewAppointment(appointment),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        side: const BorderSide(color: Color(0xFF38A169)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      icon: const Icon(
                        Icons.visibility,
                        size: 12,
                        color: Color(0xFF38A169),
                      ),
                      label: const Text(
                        'View',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF38A169),
                        ),
                      ),
                    ),
                  ),

                  // Edit Button
                  SizedBox(
                    height: 28,
                    child: OutlinedButton.icon(
                      onPressed: () => _editAppointment(appointment),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        side: const BorderSide(color: Color(0xFF2383E2)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      icon: const Icon(
                        Icons.edit,
                        size: 12,
                        color: Color(0xFF2383E2),
                      ),
                      label: const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF2383E2),
                        ),
                      ),
                    ),
                  ),

                  // Call Button
                  SizedBox(
                    height: 28,
                    child: OutlinedButton.icon(
                      onPressed: () => _callPatient(appointment),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        side: const BorderSide(color: Color(0xFFED8936)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      icon: const Icon(
                        Icons.call,
                        size: 12,
                        color: Color(0xFFED8936),
                      ),
                      label: const Text(
                        'Call',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFED8936),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'OPD':
        return const Color(0xFF2383E2);
      case 'Telecommunication':
        return const Color(0xFFED8936);
      case 'IPD':
        return const Color(0xFF805AD5);
      default:
        return const Color(0xFF2383E2);
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Confirmed':
        return const Color(0xFF38A169);
      case 'Walking':
        return const Color(0xFFED8936);
      case 'Scheduled':
        return const Color(0xFF805AD5);
      case 'Pending':
        return const Color(0xFFF56565);
      default:
        return const Color(0xFF718096);
    }
  }

  // Compact Dialog Functions
  void _showOverview() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Appointments Overview',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 18),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildOverviewSection('Today Appointments', [
                          _buildStatItem('Total', '5', const Color(0xFF2383E2)),
                          _buildStatItem(
                              'Confirmed', '4', const Color(0xFF38A169)),
                          _buildStatItem(
                              'Walking', '1', const Color(0xFFED8936)),
                        ]),
                        const SizedBox(height: 16),
                        _buildOverviewSection('Upcoming Appointments', [
                          _buildStatItem('Total', '5', const Color(0xFF805AD5)),
                          _buildStatItem(
                              'Scheduled', '4', const Color(0xFF38A169)),
                          _buildStatItem(
                              'Pending', '1', const Color(0xFFF56565)),
                        ]),
                        const SizedBox(height: 16),
                        _buildOverviewSection('Appointment Types', [
                          _buildStatItem('OPD', '6', const Color(0xFF2383E2)),
                          _buildStatItem('Telecommunication', '2',
                              const Color(0xFFED8936)),
                          _buildStatItem('IPD', '2', const Color(0xFF805AD5)),
                        ]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2383E2),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4A5568),
          ),
        ),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF4A5568),
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _showViewAnalysis() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Appointment Analysis',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 18),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildAnalysisItem(
                            'Peak Hours', '9 AM - 11 AM', Icons.access_time),
                        _buildAnalysisItem(
                            'Avg. Duration', '30 mins', Icons.timer),
                        _buildAnalysisItem('Common Condition', 'Chest pain',
                            Icons.medical_services),
                        _buildAnalysisItem('Patient Satisfaction', '92%',
                            Icons.sentiment_satisfied_alt),
                        _buildAnalysisItem(
                            'Follow-up Rate', '78%', Icons.repeat),
                        _buildAnalysisItem(
                            'Cancellation Rate', '5%', Icons.cancel),
                        _buildAnalysisItem(
                            'Wait Time', '15 mins', Icons.hourglass_empty),
                        _buildAnalysisItem(
                            'Revenue/Day', '₹45,000', Icons.attach_money),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2383E2),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnalysisItem(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFC),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF718096)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF4A5568),
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }

  void _viewAppointment(Map<String, dynamic> appointment) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Appointment Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 18),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDetailItem('Patient:', appointment['patient']),
                _buildDetailItem('Time:', appointment['time']),
                _buildDetailItem('Type:', appointment['type']),
                _buildDetailItem('Condition:', appointment['condition']),
                _buildDetailItem('Status:', appointment['status']),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2383E2),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A5568),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF2D3748),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _editAppointment(Map<String, dynamic> appointment) {
    _patientNameController.text = appointment['patient'];
    _appointmentTimeController.text = appointment['time'];
    _selectedAppointmentType = appointment['type'];
    _conditionController.text = appointment['condition'];
    _selectedStatus = appointment['status'];

    setState(() {
      _showAddAppointmentForm = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Editing appointment for ${appointment['patient']}'),
        backgroundColor: const Color(0xFF2383E2),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _callPatient(Map<String, dynamic> appointment) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFED8936).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.call,
                    color: Color(0xFFED8936),
                    size: 24,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Calling Patient',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  appointment['patient'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5568),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Appointment: ${appointment['time']}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF718096),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF718096),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Call ended with ${appointment['patient']}'),
                              backgroundColor: const Color(0xFF38A169),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFED8936),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'End Call',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addAppointment() {
    if (_patientNameController.text.isEmpty ||
        _appointmentTimeController.text.isEmpty ||
        _conditionController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.warning,
                    color: Color(0xFFF56565),
                    size: 36,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Missing Information',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please fill all required fields.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF718096),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2383E2),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      return;
    }

    final newAppointment = {
      'time': _appointmentTimeController.text,
      'patient': _patientNameController.text,
      'type': _selectedAppointmentType,
      'condition': _conditionController.text,
      'status': _selectedStatus,
    };

    if (_selectedFilter == 'Today appointment (5)') {
      _todayAppointments.add(newAppointment);
    } else {
      _upcomingAppointments.add(newAppointment);
    }

    setState(() {
      _showAddAppointmentForm = false;
      _clearForm();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Appointment added for ${_patientNameController.text}'),
        backgroundColor: const Color(0xFF38A169),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _clearForm() {
    _patientNameController.clear();
    _appointmentTimeController.clear();
    _conditionController.clear();
    _selectedAppointmentType = 'OPD';
    _selectedStatus = 'Confirmed';
  }
}
