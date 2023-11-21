import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/helpers/helper_method.dart';
import 'package:hydroinformatics_data_management_system/providers/login_provider.dart';
import 'package:provider/provider.dart';
import '../custom/bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String loginPage = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obsecureText = true;
  late LoginProvider loginProvider;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    loginProvider = Provider.of(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0XFF64B5F6), Color(0xff00b1ff)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('Welcome to HDMS', style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),),
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'images/logo.jpg',
                        height: 120,
                        width: 120,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text('Login', style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('User Name',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide your user name';
                        }
                        if (!(value.contains('@'))) {
                          return 'User name should contain @';
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 8, right: 8),
                          hintText: '01727225045@ffwcsms',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Password',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: obsecureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide your password';
                        }
                      },
                      decoration: InputDecoration(
                          suffixIcon: obsecureText
                              ? IconButton(
                                  icon: const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      obsecureText = false;
                                    });
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      obsecureText = true;
                                    });
                                  },
                                ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 8, right: 8, top: 20, bottom: 20),
                          hintText: '............',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'By proceeding, you agree to the ',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              EasyLoading.show(status: 'Loading');

                              loginProvider
                                  .getLoginInfo(emailController.text,
                                      passwordController.text)
                                  .then((value) async {
                                EasyLoading.dismiss();

                                if (value['status'] == 'success') {
                                  HelperMethod.setUserId(
                                      value['user_id'].toString());
                                  HelperMethod.setAuthToken(value['authorization']['token']);
                                  ArtSweetAlert.show(
                                      context: context,
                                      artDialogArgs: ArtDialogArgs(
                                          type: ArtSweetAlertType.success,
                                          title: 'Congratulations !!',
                                          text: value['message'].toString(),
                                          confirmButtonText: 'Home',
                                          onConfirm: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pushNamed(
                                                BottomNavigationPage
                                                    .bottomNavigationPage);
                                          }));
                                } else {
                                  ArtSweetAlert.show(
                                      context: context,
                                      artDialogArgs: ArtDialogArgs(
                                          type: ArtSweetAlertType.success,
                                          title: 'Sorry !!',
                                          text: value['message'].toString(),
                                          confirmButtonText: 'Ok',
                                          onConfirm: () {
                                            Navigator.of(context).pop();
                                          }));
                                }
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8)) // Background color
                              ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.blue),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
