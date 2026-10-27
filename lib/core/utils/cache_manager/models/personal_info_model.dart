class PersonalInfoModel {
  final String fullName;
  final String fatherName;
  final String motherName;
  final DateTime dateOfBirth;
  final String gender;
  final String religion;
  final String education;
  final String maritalStatus;
  final int numberOfDependents;

  PersonalInfoModel({
    required this.fullName,
    required this.fatherName,
    required this.motherName,
    required this.dateOfBirth,
    required this.gender,
    required this.maritalStatus,
    required this.religion,
    required this.education,
    required this.numberOfDependents,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return PersonalInfoModel(
      fullName: json['full_name'] as String,
      fatherName: json['father_name'] as String,
      motherName: json['mother_name'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      gender: json['gender'] as String,
      religion: json['religion'] as String,
      education: json['education'] as String,
      maritalStatus: json['marital_status'] as String,
      numberOfDependents: json['number_of_dependents'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'father_name': fatherName,
      'mother_name': motherName,
      'date_of_birth': dateOfBirth.toIso8601String().split('T').first,
      'gender': gender,
      'religion': religion,
      'education': education,
      'marital_status': maritalStatus,
      'number_of_dependents': numberOfDependents,
    };
  }
}
