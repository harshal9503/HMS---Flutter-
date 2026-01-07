import 'package:flutter/material.dart';

class IpdManagement extends StatefulWidget {
  const IpdManagement({super.key});

  @override
  State<IpdManagement> createState() => _IpdManagementState();
}

class _IpdManagementState extends State<IpdManagement> {
  String _selectedFilter = 'All';
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
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
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  // Title
                  const Expanded(
                    child: Text(
                      'IPD Management',
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
              child: _buildMainContent(isMobile, isTablet),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(bool isMobile, bool isTablet) {
    return Container(
      color: const Color(0xFFF7F8FA),
      child: Column(
        children: [
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
        // Header with breadcrumb
        if (isMobile) ...[
          const Text(
            'CLINICAL RECORDS >> IPD Management',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF718096),
            ),
          ),
          const SizedBox(height: 20),
        ],

        // Desktop header
        if (!isMobile)
          const Text(
            'CLINICAL RECORDS >> IPD Management',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF718096),
            ),
          ),

        if (!isMobile) const SizedBox(height: 20),

        // Title section at the search bar position
        const Text(
          'IPD Management',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        const Text(
          'In-patient department monitoring and care',
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 20),

        // STATS CARDS SECTION - Similar to LabTestRequest
        _buildStatsCards(isMobile, isTablet),

        const SizedBox(height: 20),

        // Main Content Area
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient List (Left Column)
            Expanded(
              flex: isMobile ? 1 : 4,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
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
                      'IPD Patients',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildFilterTabs(isMobile),
                    const SizedBox(height: 16),
                    _patientTile('John Smith', '45', 'B-205', 'General', 'Stable', const Color(0xFFDBEAFE)),
                    _patientTile('John Smith', '45', 'B-205', 'General', 'Critical', const Color(0xFFFEE2E2)),
                    _patientTile('John Smith', '45', 'B-205', 'General', 'Improving', const Color(0xFFDCFCE7)),
                    _patientTile('John Smith', '45', 'B-205', 'General', 'Stable', const Color(0xFFDBEAFE)),
                    _patientTile('John Smith', '45', 'B-205', 'General', 'Improving', const Color(0xFFDCFCE7)),
                    _patientTile('John Smith', '45', 'B-205', 'General', 'Stable', const Color(0xFFDBEAFE)),
                  ],
                ),
              ),
            ),
            
            if (!isMobile) const SizedBox(width: 16),
            
            // Patient Details (Right Column) - Hidden on mobile
            if (!isMobile) Expanded(
              flex: 6,
              child: Column(
                children: [
                  // Patient Details Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
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
                          children: [
                            const Text(
                              'Maria Garcia',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDBEAFE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Stable',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2563EB),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '38 Years • Female',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF718096),
                          ),
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            _Info(label: 'Bed number', value: 'B-205'),
                            _Info(label: 'Ward', value: 'General'),
                            _Info(label: 'Admission Date', value: '2024-01-12'),
                          ],
                        ),
                        const Divider(height: 24),
                        const Text(
                          'Diagnosis',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF718096),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Pneumonia',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Vital Monitoring Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
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
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFF2563EB),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Vital monitoring',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2563EB),
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            const Text(
                              'Critical notes',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF718096),
                              ),
                            ),
                            const SizedBox(width: 24),
                            const Text(
                              'Treatment plans',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF718096),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 24),
                        const Text(
                          'Vital signs',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: _buildVitalTable(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        
        // Bottom spacing
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildStatsCards(bool isMobile, bool isTablet) {
    final statsData = [
      {
        'title': 'Total patients',
        'value': '12',
        'icon': Icons.people_outline,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF59BDFF), Color(0xFFF1FAFF)],
        ),
      },
      {
        'title': 'Stable',
        'value': '8',
        'icon': Icons.check_circle_outline,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF57E3D8), Color(0xFFE3FCFA)],
        ),
      },
      {
        'title': 'Improving',
        'value': '4',
        'icon': Icons.trending_up,
        'gradient': const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF50FFFF), Color(0xFFDFFFFF)],
        ),
      },
      {
        'title': 'Critical',
        'value': '1',
        'icon': Icons.warning,
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

  Widget _buildFilterTabs(bool isMobile) {
    final filters = ['All', 'Stable', 'Critical', 'Improving'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedFilter == filter
                    ? const Color(0xFF2383E2)
                    : const Color(0xFFF7FAFC),
                foregroundColor: _selectedFilter == filter
                    ? Colors.white
                    : const Color(0xFF718096),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: _selectedFilter == filter
                        ? const Color(0xFF2383E2)
                        : const Color(0xFFE2E8F0),
                  ),
                ),
                elevation: 0,
              ),
              child: Text(
                filter,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _patientTile(String name, String age, String bed, String ward, String status, Color statusColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFFE5E7EB),
            child: Icon(Icons.person, size: 18, color: Colors.black54),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Age : ${age} yr/male',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF718096),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Bed : $bed   Ward : $ward',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF718096),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _getStatusTextColor(status),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case 'Stable':
        return const Color(0xFF2563EB);
      case 'Critical':
        return const Color(0xFFDC2626);
      case 'Improving':
        return const Color(0xFF16A34A);
      default:
        return const Color(0xFF4B5563);
    }
  }

  Widget _buildVitalTable() {
    return DataTable(
      columnSpacing: 24,
      headingRowHeight: 40,
      headingRowColor: MaterialStateProperty.all(const Color(0xFFF3F4F6)),
      headingTextStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Color(0xFF4B5563),
      ),
      dataRowHeight: 40,
      columns: const [
        DataColumn(label: Text('Time')),
        DataColumn(label: Text('BP')),
        DataColumn(label: Text('Pulse')),
        DataColumn(label: Text('Temp')),
        DataColumn(label: Text('SpO2')),
        DataColumn(label: Text('RR')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('08:00 AM', style: _tableTextStyle())),
          DataCell(Text('120/80', style: _tableTextStyle())),
          DataCell(Text('72', style: _tableTextStyle())),
          DataCell(Text('98.9°F', style: _tableTextStyle())),
          DataCell(Text('98%', style: _tableTextStyle())),
          DataCell(Text('16', style: _tableTextStyle())),
        ]),
        DataRow(cells: [
          DataCell(Text('12:00 PM', style: _tableTextStyle())),
          DataCell(Text('120/80', style: _tableTextStyle())),
          DataCell(Text('72', style: _tableTextStyle())),
          DataCell(Text('98.9°F', style: _tableTextStyle())),
          DataCell(Text('98%', style: _tableTextStyle())),
          DataCell(Text('16', style: _tableTextStyle())),
        ]),
        DataRow(cells: [
          DataCell(Text('04:00 PM', style: _tableTextStyle())),
          DataCell(Text('120/80', style: _tableTextStyle())),
          DataCell(Text('72', style: _tableTextStyle())),
          DataCell(Text('98.9°F', style: _tableTextStyle())),
          DataCell(Text('98%', style: _tableTextStyle())),
          DataCell(Text('16', style: _tableTextStyle())),
        ]),
      ],
    );
  }

  TextStyle _tableTextStyle() {
    return const TextStyle(
      fontSize: 12,
      color: Color(0xFF4B5563),
    );
  }
}

class _Info extends StatelessWidget {
  final String label;
  final String value;

  const _Info({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF718096),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
        ),
      ],
    );
  }
}