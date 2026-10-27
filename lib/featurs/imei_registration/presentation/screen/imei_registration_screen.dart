import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/services/lifecycle/app_life_cycle.dart';
import '../../../../../core/shared/widgets/button/app_button_primary.dart';
import '../../../../core/shared/widgets/app_header.dart';
import '../widgets/barcode_placeholder.dart';
import '../widgets/text_fields/imei_field.dart';
import 'barcode_scanner_screen.dart';

class ImeiRegistrationScreen extends StatefulWidget {
  const ImeiRegistrationScreen({super.key});

  @override
  State<ImeiRegistrationScreen> createState() => _ImeiRegistrationScreenState();
}

class _ImeiRegistrationScreenState extends State<ImeiRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // final SignUpDataSource _signUpDataSource = SignUpDataSource();

  bool _isLoading = false;
  bool _hasError = false;

  final _imeiCtrl = TextEditingController();
  bool _isImeiScanned = false;

  @override
  void dispose() {
    _imeiCtrl.dispose();
    super.dispose();
  }


  Future<void> _scanBarcode() async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (_) => const BarcodeScannerScreen()),
    );

    if (result != null && mounted) {
      setState(() {
        _imeiCtrl.text = result['imei'] ?? '';
        _isImeiScanned = result['scanned'] ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFE9EDF2),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            await AppLifecycle.moveToBackground();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.kScaffoldBg,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // header
                    const AppHeader(
                      title: 'IMEI Registration',
                      subTitle: '',
                      icon: Icons.account_balance,
                      isLeadingVisible: false,
                    ),
                    const SizedBox(height: 5),

                    // content
                    Expanded(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                          vertical: 10,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 430,
                            minHeight: constraints.maxHeight - 32,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 15),
                                // section hint
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: const Text(
                                    'Scan the barcode or type the IMEI number:',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: -0.4,
                                      color: AppColors.kBlack,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),

                                // input fields
                                BarcodePlaceholder(
                                  onTap: _scanBarcode,
                                  isScanned: _isImeiScanned,
                                ),
                                const SizedBox(height: 21),

                                ImeiField(controller: _imeiCtrl),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}