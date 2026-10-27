class CustomerModel {
  final String customerName;
  final String mobileNumber;
  final String accountNumber;

  CustomerModel({
    required this.customerName,
    required this.mobileNumber,
    required this.accountNumber,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerName: json['customerName'] as String,
      mobileNumber: json['mobileNumber'] as String,
      accountNumber: json['accountNumber'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'mobileNumber': mobileNumber,
      'accountNumber': accountNumber,
    };
  }
}
