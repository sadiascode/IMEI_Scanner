import 'model/accordion_detail.dart';

class Accordion {
  static const branchInfo = <AccordionDetail>[
    AccordionDetail(label: 'Division', value: 'Dhaka'),
    AccordionDetail(label: 'District', value: 'Dhaka'),
    AccordionDetail(label: 'Branch', value: 'Dhanmondi'),
  ];

  static const accountInfo = <AccordionDetail>[
    AccordionDetail(label: 'Father\'s Name (Bangla)', value: 'ইসমাইল খান'),
    AccordionDetail(label: 'Father\'s Name (English)', value: 'Ismail Khan'),
    AccordionDetail(label: 'Mother\'s Name (Bangla)', value: 'আমেনা বেগম'),
    AccordionDetail(label: 'Mother\'s Name (English)', value: 'Amena Begum'),
    AccordionDetail(label: 'Email', value: 'N/A'),
    AccordionDetail(label: 'Gender', value: 'Male'),
    AccordionDetail(label: 'Profession', value: 'Banker'),
    AccordionDetail(label: 'E-TIN Number', value: 'N/A'),
    AccordionDetail(label: 'Spouse Name', value: 'N/A'),
    AccordionDetail(label: 'Organization', value: 'South Asia Bank'),
    AccordionDetail(label: 'Designation', value: 'Senior Officer'),
    AccordionDetail(label: 'Source of Fund', value: 'Business'),
    AccordionDetail(label: 'Monthly Income', value: '55000'),
    AccordionDetail(label: 'RM Code', value: 'N/A'),
    AccordionDetail(label: 'Religion', value: 'Islam'),
  ];

  static const addressInfo = <AccordionDetail>[
    AccordionDetail(label: 'Line Address 1', value: 'Dhanmondi 27'),
    AccordionDetail(label: 'Line Address 2', value: 'N/A'),
    AccordionDetail(label: 'Division', value: 'Dhaka'),
    AccordionDetail(label: 'District', value: 'Dhaka'),
    AccordionDetail(label: 'Thana', value: 'Dhanmondi'),
    AccordionDetail(label: 'Postal Code', value: '1205'),
    AccordionDetail(label: 'Country', value: 'Bangladesh'),
    AccordionDetail(label: 'FATCA Information', value: 'No'),
  ];

  static const nomineeInfo = <AccordionDetail>[
    AccordionDetail(label: 'Nominee Name', value: 'Imran Khan'),
    AccordionDetail(label: 'Mobile Number', value: '01711111111'),
    AccordionDetail(label: 'Date of Birth', value: '1990-01-01'),
    AccordionDetail(label: 'Relation with A/C Holder', value: 'Brother'),
    AccordionDetail(label: 'Gender', value: 'Male'),
    AccordionDetail(label: 'Address', value: 'Dhanmondi 27'),
    AccordionDetail(label: 'Photo ID Type', value: 'NID'),
    AccordionDetail(label: 'NID Number', value: '1234567890123'),
  ];
}
