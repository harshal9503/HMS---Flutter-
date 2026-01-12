import 'package:flutter/material.dart';
import 'package:hms/screens/doctor/doctor_dashboard.dart';
import 'package:hms/utils/constants.dart';

class OpdIpdAppointments extends StatefulWidget {
  const OpdIpdAppointments({super.key});

  @override
  State<OpdIpdAppointments> createState() => _OpdIpdAppointmentsState();
}

class _OpdIpdAppointmentsState extends State<OpdIpdAppointments> {
  // Sample patient data
  final List<Map<String, dynamic>> _patients = [
    {
      'time': '9.00 a.m.',
      'name': 'John Smith',
      'id': 'PAT123',
      'age': '21 years',
      'gender': 'Male',
    },
    {
      'time': '10.00 a.m.',
      'name': 'Sarah Johnson',
      'id': 'PAT124',
      'age': '35 years',
      'gender': 'Female',
    },
    {
      'time': '11.00 a.m.',
      'name': 'Michael Brown',
      'id': 'PAT125',
      'age': '28 years',
      'gender': 'Male',
    },
    {
      'time': '12.00 p.m.',
      'name': 'Emily Davis',
      'id': 'PAT126',
      'age': '45 years',
      'gender': 'Female',
    },
    {
      'time': '2.00 p.m.',
      'name': 'Robert Wilson',
      'id': 'PAT127',
      'age': '32 years',
      'gender': 'Male',
    },
    {
      'time': '3.00 p.m.',
      'name': 'Lisa Anderson',
      'id': 'PAT128',
      'age': '29 years',
      'gender': 'Female',
    },
    {
      'time': '4.00 p.m.',
      'name': 'David Miller',
      'id': 'PAT129',
      'age': '38 years',
      'gender': 'Male',
    },
    {
      'time': '5.00 p.m.',
      'name': 'Jennifer Walker',
      'id': 'PAT130',
      'age': '42 years',
      'gender': 'Female',
    },
    {
      'time': '6.00 p.m.',
      'name': 'William Lee',
      'id': 'PAT131',
      'age': '51 years',
      'gender': 'Male',
    },
    {
      'time': '7.00 p.m.',
      'name': 'Maria Garcia',
      'id': 'PAT132',
      'age': '33 years',
      'gender': 'Female',
    },
  ];

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
            // Main Content Area
            Expanded(
              child: _buildMainContent(isMobile, isTablet),
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
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
        // Header with breadcrumb
        if (!isMobile)
          const Text(
            'DOCTOR PANEL >> OPD/IPD Appointments',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF718096),
            ),
          ),

        if (isMobile)
          const Text(
            'OPD/IPD Appointments',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF718096),
            ),
          ),

        const SizedBox(height: 20),

        // STATS CARDS SECTION - Matching LabTestRequest size
        _buildStatsCards(isMobile, isTablet),

        const SizedBox(height: 20),

        // Patients List Section
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
                'Patients',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 16),

              // Patients List/Table
              if (isMobile)
                _buildMobilePatientsList()
              else
                _buildDesktopPatientsTable(isTablet),
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
        'value': '10',
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2C7EDB), Color(0xFFE1F0FF)],
        ),
        'image': 'assets/images/box1.png',
      },
      {
        'title': 'Total OPD patients',
        'value': '24',
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF00B894), Color(0xFFE3FCFA)],
        ),
        'image': 'assets/images/box2.png',
      },
      {
        'title': 'Active IPD patients',
        'value': '8',
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF00C9C9), Color(0xFFDFFFFF)],
        ),
        'image': 'assets/images/box3.png',
      },
      {
        'title': 'Teleconsultation',
        'value': '6',
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF00B83B), Color(0xFFECFEEE)],
        ),
        'image': 'assets/images/box4.png',
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
              gradient: stat['gradient'] as Gradient,
              imagePath: stat['image'] as String,
              isMobile: true,
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
              gradient: stat['gradient'] as Gradient,
              imagePath: stat['image'] as String,
              isMobile: false,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Gradient gradient,
    required String imagePath,
    required bool isMobile,
  }) {
    return Container(
      height: 140, // Same height as LabTestRequest
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Background Image - Adjusted size and position
          Positioned(
            right: 0,
            bottom: 0,
            child: _buildBackgroundImage(imagePath),
          ),

          // Content - Moved to bottom with left margin
          Positioned(
            left: 20, // Same left margin
            bottom: 20, // Same bottom position
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Value - Same font size and color
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 50),
                // Title text - Same font size and color
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(String imagePath) {
    return SizedBox(
      width: 120,
      height: 90,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 120,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                _getImageLabel(imagePath),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getImageLabel(String imagePath) {
    if (imagePath.contains('box1')) return 'Appointments';
    if (imagePath.contains('box2')) return 'Lab Reports';
    if (imagePath.contains('box3')) return 'IPD Patients';
    if (imagePath.contains('box4')) return 'Teleconsultation';
    return 'Image';
  }

  Widget _buildDesktopPatientsTable(bool isTablet) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        child: DataTable(
          columnSpacing: isTablet ? 30.0 : 40.0, // Increased spacing
          headingRowHeight: 60, // Increased heading row height
          headingRowColor: MaterialStateProperty.all(const Color(0xFFF7FAFC)),
          headingTextStyle: TextStyle(
            fontSize: isTablet ? 13 : 14, // Increased font size
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4A5568),
          ),
          dataRowHeight: 70, // Increased data row height
          columns: [
            DataColumn(
              label: SizedBox(
                width: isTablet ? 140 : 160, // Increased width
                child: Padding(
                  padding: EdgeInsets.only(
                      left: isTablet ? 20 : 25), // Increased left padding
                  child: const Text(
                    'Time',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: isTablet ? 220 : 260, // Increased width
                child: Padding(
                  padding: EdgeInsets.only(
                      left: isTablet ? 20 : 25), // Increased left padding
                  child: const Text(
                    'Patient',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: isTablet ? 140 : 160, // Increased width
                child: Padding(
                  padding: EdgeInsets.only(
                      left: isTablet ? 20 : 25), // Increased left padding
                  child: const Text(
                    'Details',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: isTablet ? 260 : 300, // Increased width
                child: Padding(
                  padding: EdgeInsets.only(
                      left: isTablet ? 20 : 25), // Increased left padding
                  child: const Text(
                    'Action',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
          rows: _patients.map((patient) {
            return DataRow(
              cells: [
                DataCell(
                  Container(
                    width: isTablet ? 140 : 160, // Increased width
                    height: 70, // Fixed height
                    padding: EdgeInsets.only(
                      left: isTablet ? 20 : 25, // Increased left padding
                    ),
                    alignment: Alignment.centerLeft,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        patient['time'],
                        style: TextStyle(
                          fontSize: isTablet ? 13 : 14, // Increased font size
                          color: const Color(0xFF2D3748),
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: isTablet ? 220 : 260, // Increased width
                    height: 70, // Fixed height
                    padding: EdgeInsets.only(
                      left: isTablet ? 20 : 25, // Increased left padding
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 42, // Increased size
                            height: 42, // Increased size
                            decoration: BoxDecoration(
                              color: const Color(0xFF2383E2),
                              borderRadius:
                                  BorderRadius.circular(10), // Increased radius
                            ),
                            child: Center(
                              child: Text(
                                patient['name'][0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18, // Increased font
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16), // Increased spacing
                          Expanded(
                            child: SizedBox(
                              height: 70, // Fixed height
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    patient['name'],
                                    style: TextStyle(
                                      fontSize:
                                          isTablet ? 13 : 14, // Increased font
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF2D3748),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 4), // Reduced spacing
                                  Text(
                                    'ID: ${patient['id']}',
                                    style: TextStyle(
                                      fontSize:
                                          isTablet ? 12 : 13, // Increased font
                                      color: const Color(0xFF718096),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: isTablet ? 140 : 160, // Increased width
                    height: 70, // Fixed height
                    padding: EdgeInsets.only(
                      left: isTablet ? 20 : 25, // Increased left padding
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 70, // Fixed height
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              patient['age'],
                              style: TextStyle(
                                fontSize: isTablet ? 13 : 14, // Increased font
                                color: const Color(0xFF2D3748),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 8), // Increased spacing
                            Text(
                              patient['gender'],
                              style: TextStyle(
                                fontSize: isTablet ? 13 : 14, // Increased font
                                color: const Color(0xFF2D3748),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: isTablet ? 260 : 300, // Increased width
                    height: 70, // Fixed height
                    padding: EdgeInsets.only(
                      left: isTablet ? 20 : 25, // Increased left padding
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Admit Button
                          SizedBox(
                            width: isTablet ? 100 : 110, // Increased width
                            height: 32, // Increased height
                            child: ElevatedButton(
                              onPressed: () => _admitPatient(patient),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF73F181),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14, // Increased padding
                                  vertical: 8, // Increased padding
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Increased radius
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: isTablet ? 14 : 16, // Increased size
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8), // Increased spacing
                                  Text(
                                    'Admit',
                                    style: TextStyle(
                                      fontSize:
                                          isTablet ? 13 : 14, // Increased font
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              width: isTablet ? 16 : 20), // Increased spacing

                          // Discharge Button
                          SizedBox(
                            width: isTablet ? 120 : 130, // Increased width
                            height: 32, // Increased height
                            child: ElevatedButton(
                              onPressed: () => _dischargePatient(patient),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5EBFFF),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14, // Increased padding
                                  vertical: 8, // Increased padding
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Increased radius
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.exit_to_app,
                                    size: isTablet ? 14 : 16, // Increased size
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8), // Increased spacing
                                  Text(
                                    'Discharge',
                                    style: TextStyle(
                                      fontSize:
                                          isTablet ? 13 : 14, // Increased font
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildMobilePatientsList() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: _patients.map((patient) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16), // Increased margin
            padding: const EdgeInsets.all(16), // Increased padding
            decoration: BoxDecoration(
              color: const Color(0xFFF7FAFC),
              borderRadius: BorderRadius.circular(10), // Increased radius
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        patient['name'],
                        style: const TextStyle(
                          fontSize: 16, // Increased font
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      patient['time'],
                      style: const TextStyle(
                        fontSize: 14, // Increased font
                        color: Color(0xFF718096),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Increased spacing
                Row(
                  children: [
                    Container(
                      width: 42, // Increased size
                      height: 42, // Increased size
                      decoration: BoxDecoration(
                        color: const Color(0xFF2383E2),
                        borderRadius:
                            BorderRadius.circular(10), // Increased radius
                      ),
                      child: Center(
                        child: Text(
                          patient['name'][0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18, // Increased font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16), // Increased spacing
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ID: ${patient['id']}',
                            style: const TextStyle(
                              fontSize: 14, // Increased font
                              color: Color(0xFF718096),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6), // Increased spacing
                          Text(
                            'Age: ${patient['age']}',
                            style: const TextStyle(
                              fontSize: 14, // Increased font
                              color: const Color(0xFF718096),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6), // Increased spacing
                          Text(
                            'Gender: ${patient['gender']}',
                            style: const TextStyle(
                              fontSize: 14, // Increased font
                              color: const Color(0xFF718096),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Increased spacing
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Admit Button
                      Expanded(
                        child: Container(
                          height: 32, // Increased height
                          margin: const EdgeInsets.only(
                              right: 8), // Increased margin
                          child: ElevatedButton(
                            onPressed: () => _admitPatient(patient),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF73F181),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12, // Increased padding
                                vertical: 8, // Increased padding
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Increased radius
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  size: 16, // Increased size
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 6), // Increased spacing
                                const Text(
                                  'Admit',
                                  style: TextStyle(
                                    fontSize: 14, // Increased font
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Discharge Button
                      Expanded(
                        child: Container(
                          height: 32, // Increased height
                          child: ElevatedButton(
                            onPressed: () => _dischargePatient(patient),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5EBFFF),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12, // Increased padding
                                vertical: 8, // Increased padding
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Increased radius
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.exit_to_app,
                                  size: 16, // Increased size
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 6), // Increased spacing
                                const Text(
                                  'Discharge',
                                  style: TextStyle(
                                    fontSize: 14, // Increased font
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
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
            ),
          );
        }).toList(),
      ),
    );
  }

  void _admitPatient(Map<String, dynamic> patient) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
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
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF73F181).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF73F181),
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Admit Patient',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  patient['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'ID: ${patient['id']}',
                  style: const TextStyle(
                    fontSize: 14,
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
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
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
                              content:
                                  Text('Patient ${patient['name']} admitted'),
                              backgroundColor: const Color(0xFF73F181),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF73F181),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Admit',
                          style: TextStyle(
                            fontSize: 14,
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
        ),
      ),
    );
  }

  void _dischargePatient(Map<String, dynamic> patient) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
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
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5EBFFF).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.exit_to_app,
                    color: Color(0xFF5EBFFF),
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Discharge Patient',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  patient['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'ID: ${patient['id']}',
                  style: const TextStyle(
                    fontSize: 14,
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
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
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
                              content:
                                  Text('Patient ${patient['name']} discharged'),
                              backgroundColor: const Color(0xFF5EBFFF),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5EBFFF),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Discharge',
                          style: TextStyle(
                            fontSize: 14,
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
        ),
      ),
    );
  }
}
