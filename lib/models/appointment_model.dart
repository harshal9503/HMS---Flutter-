// lib/models/appointment_model.dart
class Appointment {
  final String id;
  final String patientName;
  final String doctor;
  final String department;
  final String date;
  final String time;
  final String type;
  final String status;
  final String contact;
  final String email;
  final String age;
  final String address;
  final String gender;
  final String reason;
  final String notes;
  final String priority;

  Appointment({
    required this.id,
    required this.patientName,
    required this.doctor,
    required this.department,
    required this.date,
    required this.time,
    required this.type,
    required this.status,
    required this.contact,
    this.email = '',
    this.age = '',
    this.address = '',
    this.gender = '',
    this.reason = '',
    this.notes = '',
    this.priority = 'Normal',
  });

  // Optional: Add a copyWith method for editing
  Appointment copyWith({
    String? id,
    String? patientName,
    String? doctor,
    String? department,
    String? date,
    String? time,
    String? type,
    String? status,
    String? contact,
    String? email,
    String? age,
    String? address,
    String? gender,
    String? reason,
    String? notes,
    String? priority,
  }) {
    return Appointment(
      id: id ?? this.id,
      patientName: patientName ?? this.patientName,
      doctor: doctor ?? this.doctor,
      department: department ?? this.department,
      date: date ?? this.date,
      time: time ?? this.time,
      type: type ?? this.type,
      status: status ?? this.status,
      contact: contact ?? this.contact,
      email: email ?? this.email,
      age: age ?? this.age,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      reason: reason ?? this.reason,
      notes: notes ?? this.notes,
      priority: priority ?? this.priority,
    );
  }
}