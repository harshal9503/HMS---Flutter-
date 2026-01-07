import 'package:flutter/material.dart';

class DischargeSummary extends StatelessWidget {
  const DischargeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2383E2),
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Discharge Summary',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isMobile ? 12 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _statsRow(isMobile),
              const SizedBox(height: 20),

              /// TITLE + ACTION BUTTON (SAME ROW)
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Discharge Summary',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Create and manage patient discharge summaries',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.sync_alt, size: 18),
                    label: const Text('Change treatment plan'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: _ipdPatients()),
                  if (!isMobile) const SizedBox(width: 16),
                  Expanded(flex: 6, child: _summaryForm()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===================== STATS =====================

  Widget _statsRow(bool isMobile) {
    return Row(
      children: [
        _statCard('12', 'Total patients',
            const LinearGradient(colors: [Color(0xFF60A5FA), Color(0xFFEFF6FF)])),
        const SizedBox(width: 12),
        _statCard(
            '8',
            'Ready for discharge',
            const LinearGradient(
                colors: [Color(0xFF5EEAD4), Color(0xFFECFEFF)])),
      ],
    );
  }

  Widget _statCard(String value, String label, Gradient gradient) {
    return Expanded(
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(label, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  // ===================== LEFT LIST =====================

  Widget _ipdPatients() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'IPD Patients',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          ...List.generate(4, (_) => _patientTile()),
        ],
      ),
    );
  }

  Widget _patientTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: _innerBox(),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFFE5E7EB),
            child: Icon(Icons.person, size: 18),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Smith',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 2),
                Text('Age : 45 yr/male', style: TextStyle(fontSize: 12)),
                Text('Bed : B-205  Ward : General',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFDCFCE7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Improved',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF16A34A),
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  // ===================== RIGHT FORM =====================

  Widget _summaryForm() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Maria Garcia',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5CF6),
                ),
                icon: const Icon(Icons.auto_fix_high, size: 16),
                label: const Text('Ai Auto Fill'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text('45 Years • Male • Bed: A-101'),
          const Text('Admission Date: 2024-01-10',
              style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 20),

          ...[
            'Chief Complaints',
            'History of Present Illness',
            'Past Medical History',
            'Examination Findings',
            'Investigations',
            'Final Diagnosis',
            'Treatment Given',
            'Course in Hospital',
            'Condition at Discharge',
            'Medications on Discharge',
            'Follow-up Instructions',
            'Diet Advice',
            'Activity Restrictions',
          ].map(_inputField),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _actionBtn('Save', Icons.save, const Color(0xFF8B5CF6)),
              _actionBtn(
                  'Generate PDF', Icons.picture_as_pdf, const Color(0xFF2563EB)),
              _actionBtn('Sign and finalise', Icons.verified,
                  const Color(0xFF16A34A)),
              _actionBtn(
                  'Voice entry', Icons.mic, const Color(0xFF7C3AED)),
            ],
          )
        ],
      ),
    );
  }

  Widget _inputField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          Container(
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionBtn(String text, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: color),
        icon: Icon(icon, size: 16),
        label: Text(text),
      ),
    );
  }

  // ===================== SHARED STYLES =====================

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  BoxDecoration _innerBox() {
    return BoxDecoration(
      color: const Color(0xFFF8FBFF),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: const Color(0xFFE5E7EB)),
    );
  }
}
