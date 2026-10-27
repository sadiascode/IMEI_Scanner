class ProfessionInfoModel {
  final String professionSchedule;
  final String professionType;
  final String isWorkingAtSeb;
  final String companyName;
  final String officeAddress;
  final String designation;
  final DateTime dateOfJoin;
  final DateTime dateOfBirth;
  final double monthlyIncome;
  final double monthlyExpense;
  final String education;
  final String jobExperience;
  final String maritalStatus;
  final int childrenCount;
  final int eldestChildAge;
  final String officeId;
  final int tinNumber;

  ProfessionInfoModel({
    required this.professionSchedule,
    required this.professionType,
    required this.isWorkingAtSeb,
    required this.companyName,
    required this.officeAddress,
    required this.designation,
    required this.dateOfJoin,
    required this.dateOfBirth,
    required this.monthlyIncome,
    required this.monthlyExpense,
    required this.education,
    required this.jobExperience,
    required this.maritalStatus,
    required this.childrenCount,
    required this.eldestChildAge,
    required this.officeId,
    required this.tinNumber,
  });

  factory ProfessionInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfessionInfoModel(
      professionSchedule: json['profession_schedule'] as String,
      professionType: json['profession_type'] as String,
      isWorkingAtSeb: json['is_working_at_seb'] as String,
      dateOfJoin: DateTime.parse(json['date_of_join'] as String),
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      companyName: json['company_name'] as String,
      officeAddress: json['office_address'] as String,
      designation: json['designation'] as String,
      monthlyIncome: json['monthly_income'] as double,
      monthlyExpense: json['monthly_expense'] as double,
      education: json['education'] as String,
      jobExperience: json['job_experience'] as String,
      maritalStatus: json['marital_status'] as String,
      childrenCount: json['children_count'] as int,
      eldestChildAge: json['eldest_child_age'] as int,
      officeId: json['office_id'] as String,
      tinNumber: json['tin_number'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profession_schedule': professionSchedule,
      'profession_type': professionType,
      'is_working_at_seb': isWorkingAtSeb,
      'company_name': companyName,
      'office_address': officeAddress,
      'designation': designation,
      'date_of_join': dateOfJoin.toIso8601String().split('T').first,
      'date_of_birth': dateOfBirth.toIso8601String().split('T').first,
      'monthly_income': monthlyIncome,
      'monthly_expense': monthlyExpense,
      'education': education,
      'job_experience': jobExperience,
      'marital_status': maritalStatus,
      'children_count': childrenCount,
      'eldest_child_age': eldestChildAge,
      'office_id': officeId,
      'tin_number': tinNumber,
    };
  }
}
