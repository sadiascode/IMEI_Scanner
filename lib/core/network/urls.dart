class Urls {
  // app version
  static const String currentVersion = '0';

  // base url
  static const String baseUrl = 'http://192.168.110.161/api/v1/core';
  static const String baseUrlImage = 'http://192.168.110.161/';

  // static const String baseUrlPsychometric =
  //     "https://eloan.infiniatechltd.com/api";

  static const String baseUrlPsychometric =
      "https://eloan.infiniatechltd.com/api/psychometric";

  // psychometricStart
  // static const String psychometricStartEndPoint =
  //     "$baseUrlPsychometric/psychometric/start";

  static const String psychometricStartEndPoint =
      "$baseUrlPsychometric/questionnaires";

  // psychometricSubmit
  static const String psychometricSubmitEndPoint =
      "$baseUrlPsychometric/psychometric/submit";

  // dummy endpoints
  static const String loginEndPoint = '$baseUrl/dummy_login';
  static const String signupEndPoint = '$baseUrl/dummy_signup';

  // api endpoints
  static const String authVersionCheck = '$baseUrl/auth/version/check';

  static const String fetchPostEndPoint =
      'https://jsonplaceholder.typicode.com/posts/1';

  // customer endpoints
  static const String customerCategoryEndPoint = '$baseUrl/customer/category';

  static const String customerProfileEndPoint = '$baseUrl/customer/profile';

  static const String customerUpdateProfileEndPoint =
      '$baseUrl/customer/update/profile';

  static const String customerChangePinEndPoint = '$baseUrl/customer/changePin';

  static const String customerScoreEndPoint = '$baseUrl/customer/score';

  static const String customerMdmImeiVerifyEndPoint =
      '$baseUrl/customer/mdm/imeiverify';

  static const String customerWaltonMdmSaleEndPoint =
      '$baseUrl/customer/walton-mdm/sale';

  static const String customerMdmEnrollEndPoint =
      '$baseUrl/customer/mdm/enroll';

  static const String customerMdmEmiEndPoint = '$baseUrl/customer/mdm/emi';

  static const String customerMdmDeviceStatusEndPoint =
      '$baseUrl/customer/mdm/device_status';

  static const String customerMfsVerifyEndPoint =
      '$baseUrl/customer/mfs/verify';

  static const String customerApplicationEndPoint =
      '$baseUrl/customer/application';

  static const String customerUpdateApplicationEndPoint =
      '$baseUrl/customer/bank_api/update_info/application';

  static const String customerUpdateStatusEndPoint =
      '$baseUrl/customer/bank_api/update_status/application';

  static const String customerLoanSimulationEndPoint =
      '$baseUrl/customer/bank_api/loan_simulation';

  static const String customerAccountVerifyEndPoint =
      '$baseUrl/customer/bank_api/account_verify';

  static const String customerEkycMobileVerifyEndPoint =
      '$baseUrl/customer/ekyc/mobile_verify';

  static const String customerEkycAccountTrackEndPoint =
      '$baseUrl/customer/ekyc/account_track';

  static const String customerEkycNidVerifyEndPoint =
      '$baseUrl/customer/ekyc/nid_verify';

  static const String customerEkycAccountOpenEndPoint =
      '$baseUrl/customer/ekyc/account_open';

  static const String customerAccountBalanceEndPoint =
      '$baseUrl/customer/bank_api/account_balance';

  static const String customerAccountBalanceStatusEndPoint =
      '$baseUrl/customer/bank_api/account_balance_status';

  static const String customerSendOtpForLoanCreateEndPoint =
      '$baseUrl/customer/bank_api/send_otp_for_loan_create';

  static const String customerLoanCreateOtpEndPoint =
      '$baseUrl/customer/bank_api/loan_create_otp';

  static const String customerLoanDisburseProfeeEndPoint =
      '$baseUrl/customer/bank_api/loan_disburse_profee';

  static const String customerLoanDisburseCibEndPoint =
      '$baseUrl/customer/bank_api/loan_disburse_cib';

  static const String customerLoanDisburseTcsaEndPoint =
      '$baseUrl/customer/bank_api/loan_disburse_tcsa';

  static const String customerLoanDisburseTcsaInfiniaEndPoint =
      '$baseUrl/customer/bank_api/loan_disburse_tcsa_infinia';

  static const String customerEmiPaymentsByAccountEndPoint =
      '$baseUrl/customer/bank_api/emi_payments_by_account';

  static const String customerInstallmentScheduleEndPoint =
      '$baseUrl/customer/walton-mdm/installmentschedule';

  static const String customerEmiPaymentsEndPoint =
      '$baseUrl/customer/walton-mdm/emi_payments';

  static const String customerAllDivisionEndPoint =
      '$baseUrl/customer/all_division';

  static const String customerAllDistrictEndPoint =
      '$baseUrl/customer/all_district';

  static const String customerAllBranchEndPoint =
      '$baseUrl/customer/all_branch';

  static const String customerLocationAllDivisionEndPoint =
      '$baseUrl/customer/location/all_division';

  static const String customerLocationCitiesByDivisionEndPoint =
      '$baseUrl/customer/location/cities_by_division';

  static const String customerLocationAreasByCityEndPoint =
      '$baseUrl/customer/location/areas_by_city';

  static const String customerCategoryProductsEndPoint =
      '$baseUrl/customer/category';

  static const String customerBrandEndPoint = '$baseUrl/customer/brand';

  static const String customerProductEndPoint = '$baseUrl/customer/product';

  // dms auth
  static const String dmsAuthEndPoint = '$baseUrl/dms/auth';
  static const String authLoginEndPoint = '$baseUrl/auth/login';
  static const String setPinEndPoint = '$baseUrl/auth/setpin';
  static const String resetPinEndPoint = '$baseUrl/auth/resetpin';

  // otp login
  static const String otpLoginEndPoint = '$baseUrl/auth/otplogin';
  static const String sendOtpEndPoint = '$baseUrl/auth/send-otp';
  static const String verifyOtpEndPoint = '$baseUrl/auth/verify-otp';
}
