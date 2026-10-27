class BranchInfoModel {
  final String division;
  final String city;
  final String branch;

  BranchInfoModel({
    required this.division,
    required this.city,
    required this.branch,
  });

  factory BranchInfoModel.fromJson(Map<String, dynamic> json) {
    return BranchInfoModel(
      division: json['division'] as String,
      city: json['city'] as String,
      branch: json['branch_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'division': division, 'city': city, 'branch_name': branch};
  }
}
