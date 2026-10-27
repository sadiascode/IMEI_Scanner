class NomineeInfoModel {
  final String fullName;
  final String nidNumber;
  final String phone;
  final String dateOfBirth;
  final String nomineeChangeReason;
  final String relationship;

  NomineeInfoModel({
    required this.fullName,
    required this.nidNumber,
    required this.phone,
    required this.dateOfBirth,
    required this.nomineeChangeReason,
    required this.relationship,
  });

  factory NomineeInfoModel.fromJson(Map<String, dynamic> json) {
    return NomineeInfoModel(
      fullName: json['full_name'] as String,
      nidNumber: json['nid_number'] as String,
      phone: json['phone'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      nomineeChangeReason: json['nominee_change_reason'] as String,
      relationship: json['relationship'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'nid_number': nidNumber,
      'phone': phone,
      'date_of_birth': dateOfBirth,
      'nominee_change_reason': nomineeChangeReason,
      'relationship': relationship,
    };
  }
}
