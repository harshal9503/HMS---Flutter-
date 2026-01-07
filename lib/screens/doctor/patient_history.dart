import 'package:flutter/material.dart';

class PatientHistory extends StatefulWidget {
  const PatientHistory({super.key});

  @override
  State<PatientHistory> createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
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
                      'Patient History',
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
              child: Container(
                color: const Color(0xFFF7F8FA),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Divider
                      Container(height: 1, color: const Color(0xFFE2E8F0)),

                      // Main Content
                      Container(
                        padding: EdgeInsets.all(
                          isMobile
                              ? 16
                              : isTablet
                                  ? 20
                                  : 24,
                        ),
                        child: _buildContent(isMobile, isTablet),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
            'CLINICAL RECORDS >> Patient History',
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
            'CLINICAL RECORDS >> Patient History',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF718096),
            ),
          ),

        if (!isMobile) const SizedBox(height: 20),

        const Text(
          'Patient history timeline',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        const Text(
          'Chronological view of patient medical records',
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 16),

        _patientInfoCard(isMobile, isTablet),
        const SizedBox(height: 24),

        const Text(
          'Medical history - John Smith',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),

        // Timeline items
        _timelineItem(
          color: const Color(0xFFE8F1FF),
          iconColor: const Color(0xFF3B82F6),
          title: 'OPD Consultation',
          subtitle: 'Chest pain evaluation , ECG performed',
        ),
        _timelineItem(
          color: const Color(0xFFF1EDFF),
          iconColor: const Color(0xFF8B5CF6),
          title: 'Laboratory Tests',
          subtitle: 'Complete Blood Count, Lipid Profile, Troponin I',
        ),
        _timelineItem(
          color: const Color(0xFFFFF1E8),
          iconColor: const Color(0xFFF97316),
          title: 'OPD Consultation',
          subtitle: 'Chest pain evaluation , ECG performed',
        ),
        _timelineItem(
          color: const Color(0xFFEAF7EF),
          iconColor: const Color(0xFF22C55E),
          title: 'Diagnosis',
          subtitle: 'Acute Myocardial Infarction - Inferior Wall',
        ),
        _timelineItem(
          color: const Color(0xFFFCEBFF),
          iconColor: const Color(0xFFD946EF),
          title: 'Prescription',
          subtitle: 'Aspirin 75mg, Atorvastatin 40mg, Clopidogrel 75mg',
        ),
        _timelineItem(
          color: const Color(0xFFFFF7DB),
          iconColor: const Color(0xFFEAB308),
          title: 'Follow-up Visit',
          subtitle: 'Blood pressure monitoring, medication review',
        ),
        _timelineItem(
          color: const Color(0xFFE8F1FF),
          iconColor: const Color(0xFF3B82F6),
          title: 'Annual Health Checkup',
          subtitle: 'Complete metabolic panel, HbA1c, Lipid profile',
        ),

        // Add some bottom padding for better scrolling
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _patientInfoCard(bool isMobile, bool isTablet) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Patient information',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _inputBox(
                  label: 'Select patient',
                  value: 'Sahah- Johnson UH20242001',
                  trailing: Icons.keyboard_arrow_down,
                ),
              ),
              SizedBox(width: isMobile ? 8 : 16),
              Expanded(
                child: _inputBox(
                  label: 'Search history',
                  value: 'Search by diagnosis medication',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputBox({
    required String label,
    required String value,
    IconData? trailing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
              if (trailing != null)
                Icon(trailing, size: 18, color: Colors.black45),
            ],
          ),
        ),
      ],
    );
  }

  Widget _timelineItem({
    required Color color,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.medical_services, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFBFDFF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.person_outline,
                          size: 14, color: Colors.black45),
                      SizedBox(width: 4),
                      Text(
                        'Dr, Sarah williams',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // View Details action
                        },
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                              color: Color(0xFF2563EB),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 24),
                      TextButton(
                        onPressed: () {
                          // Download action
                        },
                        child: const Text(
                          'Download',
                          style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
