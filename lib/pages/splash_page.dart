import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydroinformatics_data_management_system/helpers/helper_method.dart';
import 'package:hydroinformatics_data_management_system/pages/login_page.dart';
import 'package:hydroinformatics_data_management_system/pages/services_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String splashPage = 'splashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) {

      Navigator.of(context).pushReplacementNamed(LoginPage.loginPage);

      // HelperMethod.getStudentId().then((value) {
      //   print("Value: ${value}");
      //   if (value != null) {
      //     Navigator.of(context).pushReplacementNamed(ServicesPage.servicesPage);
      //   } else {
      //     Navigator.of(context).pushReplacementNamed(LoginPage.loginPage);
      //   }
      // });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF64B5F6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
