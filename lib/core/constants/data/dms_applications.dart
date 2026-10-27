enum ApplicationStatus { disbursed, downPaymentPending, draft, submitted }

class DmsApplications {
  DmsApplications._();

  static const List<Map<String, dynamic>> data = [
    {
      'name': 'Rahim Uddin',
      'device': 'Samsung Galaxy A16 - 9 months',
      'date': '28 Sep 2026',
      'amount': '৳18,990',
      'status': ApplicationStatus.disbursed,
      'nextStepText': 'Loan is active',
      'actionText': 'View details',
      'isActionFilled': false,
    },
    {
      'name': 'Nusrat Jahan',
      'device': 'Honor X7c - 6 months',
      'date': '01 Oct 2026',
      'amount': '৳14,500',
      'status': ApplicationStatus.downPaymentPending,
      'nextStepText': 'Next: Down payment - customer OTP needed',
      'actionText': 'Resume',
      'isActionFilled': true,
    },
    {
      'name': 'Tanvir Ahmed',
      'device': 'Device not selected yet',
      'date': '02 Oct 2026',
      'amount': '—',
      'status': ApplicationStatus.draft,
      'nextStepText': 'Next: Address - customer OTP needed',
      'actionText': 'Resume',
      'isActionFilled': true,
    },
    {
      'name': 'Mitu Akter',
      'device': 'Samsung Galaxy A06 - 12 months',
      'date': '30 Sep 2026',
      'amount': '৳12,000',
      'status': ApplicationStatus.submitted,
      'nextStepText': 'Pending approval',
      'actionText': 'View details',
      'isActionFilled': false,
    },
  ];
}
