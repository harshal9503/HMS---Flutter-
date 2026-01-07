import 'package:flutter/material.dart';

class PatientRegistration extends StatefulWidget {
  const PatientRegistration({super.key});

  @override
  State<PatientRegistration> createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  String? _selectedPatientType;
  String? _selectedDoctor;
  
  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _patientTypes = ['OPD', 'IPD'];
  final List<String> _doctors = ['Dr. Sharma', 'Dr. Patel', 'Dr. Gupta', 'Dr. Singh', 'Dr. Kumar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Patient Registration'),
        backgroundColor: const Color(0xFF2D3748),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Patient Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 20),
              
              // Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              // Age
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Age *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              // Gender
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Gender *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.transgender_outlined),
                ),
                value: _selectedGender,
                items: _genders.map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              // Mobile Number
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Mobile Number *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  if (value.length != 10) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              // Address
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 15),
              
              // Guardian Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Guardian Name (if needed)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.family_restroom_outlined),
                ),
              ),
              const SizedBox(height: 15),
              
              // Email (Optional)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email (Optional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              
              const Divider(),
              const SizedBox(height: 20),
              
              const Text(
                'Medical Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 20),
              
              // Patient Type
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Patient Type *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.medical_services_outlined),
                ),
                value: _selectedPatientType,
                items: _patientTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPatientType = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select patient type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              // Doctor Selection
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Assign Doctor *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                value: _selectedDoctor,
                items: _doctors.map((doctor) {
                  return DropdownMenuItem(
                    value: doctor,
                    child: Text(doctor),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDoctor = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a doctor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              
              // Emergency Contact
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Emergency Contact Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.emergency_outlined),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              
              // Blood Group
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Blood Group (Optional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.bloodtype_outlined),
                ),
              ),
              const SizedBox(height: 30),
              
              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _registerPatient();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4299E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Register Patient',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Generate Patient ID
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FFF4),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF48BB78)),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.qr_code_scanner_outlined,
                      size: 40,
                      color: Color(0xFF48BB78),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Patient ID will be generated after registration',
                      style: TextStyle(
                        color: Color(0xFF2D3748),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Format: HMS-P-2024-001',
                      style: TextStyle(
                        color: Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerPatient() {
    // Generate patient ID
    final patientId = 'HMS-P-${DateTime.now().year}-${_generateRandomId()}';
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Registration Successful'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 60,
              color: Color(0xFF48BB78),
            ),
            const SizedBox(height: 20),
            Text(
              'Patient ID: $patientId',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Patient has been successfully registered and assigned to doctor.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to reception dashboard
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4299E1),
            ),
            child: const Text('View in Dashboard'),
          ),
        ],
      ),
    );
  }

  String _generateRandomId() {
    return (1000 + DateTime.now().millisecondsSinceEpoch % 9000).toString();
  }
}