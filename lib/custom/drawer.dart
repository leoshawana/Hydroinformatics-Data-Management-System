import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageDrawer extends StatefulWidget {
  const HomePageDrawer({super.key});

  @override
  State<HomePageDrawer> createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0XFF64B5F6), Color(0XFF42A5F5)])),
        child: Drawer(
          backgroundColor: Colors.transparent,
          width: MediaQuery.of(context).size.width / 1.4,
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/profile.png'),
                      radius: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Anik Kumar Saha',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Home',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.quick_contacts_mail_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Contact Us',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Logout',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.white,
                    height: 20,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.featured_play_list_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text('Version 1.0.0',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white))
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
