import 'package:flutter/material.dart';
import 'package:hms/utils/constants.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPatient = '';
  String _selectedAppointmentType = 'OPD';
  String _selectedTime = '9:00 AM';
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _descriptionController = TextEditingController();

  List<String> patients = [
    'Mann Sharma',
    'John Smith',
    'Sarah Johnson',
    'Mike Wilson'
  ];
  List<String> appointmentTypes = [
    'OPD',
    'Follow-up',
    'Teleconsultation',
    'IPD Review'
  ];
  List<String> timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Appointment'),
        backgroundColor: const Color(0xFF2383E2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFormField(
                'Select Patient',
                Icons.person,
                DropdownButtonFormField<String>(
                  value: _selectedPatient.isNotEmpty ? _selectedPatient : null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Select patient',
                  ),
                  items: patients.map((patient) {
                    return DropdownMenuItem<String>(
                      value: patient,
                      child: Text(patient),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPatient = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a patient';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              _buildFormField(
                'Appointment Type',
                Icons.event_note,
                DropdownButtonFormField<String>(
                  value: _selectedAppointmentType,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Select appointment type',
                  ),
                  items: appointmentTypes.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedAppointmentType = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildFormField(
                      'Date',
                      Icons.calendar_today,
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          child: Text(
                            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildFormField(
                      'Time',
                      Icons.access_time,
                      DropdownButtonFormField<String>(
                        value: _selectedTime,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        items: timeSlots.map((time) {
                          return DropdownMenuItem<String>(
                            value: time,
                            child: Text(time),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedTime = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildFormField(
                'Description',
                Icons.description,
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter appointment description',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2383E2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Schedule Appointment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, IconData icon, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF718096), size: 20),
              const SizedBox(width: 12),
              Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Save appointment to database
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Appointment scheduled successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }
}
