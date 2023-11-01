import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationApprovalPage extends StatefulWidget {
  const RegistrationApprovalPage({super.key});

  static const String registrationApprovalPage = 'registrationApprovalPage';

  @override
  State<RegistrationApprovalPage> createState() =>
      _RegistrationApprovalPageState();
}

class _RegistrationApprovalPageState extends State<RegistrationApprovalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF64B5F6),
        title: Text(
          'Registration Approval Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
