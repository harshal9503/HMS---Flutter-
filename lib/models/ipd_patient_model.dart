class IPDPatient {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String ward;
  final String bedNo;
  final String admissionDate;
  final String doctor;
  final String status;
  final String? diagnosis;
  final String? contactNumber;
  final String? address;
  final String? emergencyContact;
  final String? insuranceProvider;
  final String? insurancePolicyNo;
  final List<String>? medications;
  final List<String>? labReports;
  final String? dischargeDate;
  final String? dischargeSummary;

  IPDPatient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.ward,
    required this.bedNo,
    required this.admissionDate,
    required this.doctor,
    required this.status,
    this.diagnosis,
    this.contactNumber,
    this.address,
    this.emergencyContact,
    this.insuranceProvider,
    this.insurancePolicyNo,
    this.medications,
    this.labReports,
    this.dischargeDate,
    this.dischargeSummary,
  });

  IPDPatient copyWith({
    String? id,
    String? name,
    int? age,
    String? gender,
    String? ward,
    String? bedNo,
    String? admissionDate,
    String? doctor,
    String? status,
    String? diagnosis,
    String? contactNumber,
    String? address,
    String? emergencyContact,
    String? insuranceProvider,
    String? insurancePolicyNo,
    List<String>? medications,
    List<String>? labReports,
    String? dischargeDate,
    String? dischargeSummary,
  }) {
    return IPDPatient(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      ward: ward ?? this.ward,
      bedNo: bedNo ?? this.bedNo,
      admissionDate: admissionDate ?? this.admissionDate,
      doctor: doctor ?? this.doctor,
      status: status ?? this.status,
      diagnosis: diagnosis ?? this.diagnosis,
      contactNumber: contactNumber ?? this.contactNumber,
      address: address ?? this.address,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      insuranceProvider: insuranceProvider ?? this.insuranceProvider,
      insurancePolicyNo: insurancePolicyNo ?? this.insurancePolicyNo,
      medications: medications ?? this.medications,
      labReports: labReports ?? this.labReports,
      dischargeDate: dischargeDate ?? this.dischargeDate,
      dischargeSummary: dischargeSummary ?? this.dischargeSummary,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'ward': ward,
      'bedNo': bedNo,
      'admissionDate': admissionDate,
      'doctor': doctor,
      'status': status,
      'diagnosis': diagnosis,
      'contactNumber': contactNumber,
      'address': address,
      'emergencyContact': emergencyContact,
      'insuranceProvider': insuranceProvider,
      'insurancePolicyNo': insurancePolicyNo,
      'medications': medications,
      'labReports': labReports,
      'dischargeDate': dischargeDate,
      'dischargeSummary': dischargeSummary,
    };
  }

  factory IPDPatient.fromJson(Map<String, dynamic> json) {
    return IPDPatient(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      ward: json['ward'] as String,
      bedNo: json['bedNo'] as String,
      admissionDate: json['admissionDate'] as String,
      doctor: json['doctor'] as String,
      status: json['status'] as String,
      diagnosis: json['diagnosis'] as String?,
      contactNumber: json['contactNumber'] as String?,
      address: json['address'] as String?,
      emergencyContact: json['emergencyContact'] as String?,
      insuranceProvider: json['insuranceProvider'] as String?,
      insurancePolicyNo: json['insurancePolicyNo'] as String?,
      medications: (json['medications'] as List?)?.cast<String>(),
      labReports: (json['labReports'] as List?)?.cast<String>(),
      dischargeDate: json['dischargeDate'] as String?,
      dischargeSummary: json['dischargeSummary'] as String?,
    );
  }
}
