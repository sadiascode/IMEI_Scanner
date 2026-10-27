class AddressInfoModel {
  final String divisionPresent;
  final String cityPresent;
  final String thanaPresent;
  final String addressLinePresent;
  // final bool sameAsPresent;
  // final String divisionPermanent;
  // final String cityPermanent;
  // final String thanaPermanent;
  // final String addressLinePermanent;
  final String residentialStatus;
  final String landlordName;
  final int monthlyRent;
  final String rentedHowLong;

  AddressInfoModel({
    required this.divisionPresent,
    required this.cityPresent,
    required this.thanaPresent,
    required this.addressLinePresent,
    // required this.sameAsPresent,
    // required this.divisionPermanent,
    // required this.cityPermanent,
    // required this.thanaPermanent,
    // required this.addressLinePermanent,
    required this.residentialStatus,
    required this.landlordName,
    required this.monthlyRent,
    required this.rentedHowLong,
  });

  factory AddressInfoModel.fromJson(Map<String, dynamic> json) {
    return AddressInfoModel(
      divisionPresent: json['division_present'] as String,
      cityPresent: json['city_present'] as String,
      thanaPresent: json['thana_present'] as String,
      addressLinePresent: json['address_line_present'] as String,
      // sameAsPresent: json['same_as_present'] as bool,
      // divisionPermanent: json['division_permanent'] as String,
      // cityPermanent: json['city_permanent'] as String,
      // thanaPermanent: json['thana_permanent'] as String,
      // addressLinePermanent: json['address_line_permanent'] as String,
      residentialStatus: json['residential_status'] as String,
      landlordName: json['landlord_name'] as String,
      monthlyRent: json['monthly_rent'] as int,
      rentedHowLong: json['rented_how_long'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'division_present': divisionPresent,
      'city_present': cityPresent,
      'thana_present': thanaPresent,
      'address_line_present': addressLinePresent,
      // 'same_as_present': sameAsPresent,
      // 'division_permanent': divisionPermanent,
      // 'city_permanent': cityPermanent,
      // 'thana_permanent': thanaPermanent,
      // 'address_line_permanent': addressLinePermanent,
      'residential_status': residentialStatus,
      'landlord_name': landlordName,
      'monthly_rent': monthlyRent,
      'rented_how_long': rentedHowLong,
    };
  }
}
