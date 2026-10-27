import 'package:flutter/material.dart';
import 'featurs/imei_registration/presentation/screen/imei_registration_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ImeiScanner());
}

class ImeiScanner extends StatelessWidget {
  const ImeiScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMEI Scanner",
      debugShowCheckedModeBanner: false,
      home: ImeiRegistrationScreen(),
    );
  }
}