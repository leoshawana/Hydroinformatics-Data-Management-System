import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hydroinformatics_data_management_system/pages/data_request_details_page.dart";

class DataRequestPage extends StatefulWidget {
  const DataRequestPage({super.key});

  static const String dataRequestPage = 'dataRequestPage';

  @override
  State<DataRequestPage> createState() => _DataRequestPageState();
}

class _DataRequestPageState extends State<DataRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Data Request (Pending)',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              DataRequestDetailsPage.dataRequestDetailsPage);
                        },
                        child: Card(
                            color: Colors.blue,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('User Name: ${""}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Email: ${""}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Contact: ${""}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Request Type: ${""}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Invoice Date: ${""}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                ],
                              ),
                            )),
                      );
                    }),
              ],
            ),
          )),
    );
  }
}
