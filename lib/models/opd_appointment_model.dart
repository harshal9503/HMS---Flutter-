class OPDAppointment {
  final String id;
  final String patientName;
  final int age;
  final String gender;
  final String doctor;
  final String department;
  final String time;
  final String date;
  final String status;
  final String contactNumber;
  final String appointmentType;
  final String reason;

  OPDAppointment({
    required this.id,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.doctor,
    required this.department,
    required this.time,
    required this.date,
    required this.status,
    required this.contactNumber,
    required this.appointmentType,
    required this.reason,
  });

  OPDAppointment copyWith({
    String? id,
    String? patientName,
    int? age,
    String? gender,
    String? doctor,
    String? department,
    String? time,
    String? date,
    String? status,
    String? contactNumber,
    String? appointmentType,
    String? reason,
  }) {
    return OPDAppointment(
      id: id ?? this.id,
      patientName: patientName ?? this.patientName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      doctor: doctor ?? this.doctor,
      department: department ?? this.department,
      time: time ?? this.time,
      date: date ?? this.date,
      status: status ?? this.status,
      contactNumber: contactNumber ?? this.contactNumber,
      appointmentType: appointmentType ?? this.appointmentType,
      reason: reason ?? this.reason,
    );
  }
}

class OPDDepartment {
  final String name;
  final int doctors;
  final int patientsToday;
  final String availability;
  final String waitingTime;

  OPDDepartment({
    required this.name,
    required this.doctors,
    required this.patientsToday,
    required this.availability,
    required this.waitingTime,
  });
}

class OPDDoctor {
  final String name;
  final String department;
  final String timings;
  final int availableSlots;
  final String currentStatus;
  final double consultationFee;

  OPDDoctor({
    required this.name,
    required this.department,
    required this.timings,
    required this.availableSlots,
    required this.currentStatus,
    required this.consultationFee,
  });
}
