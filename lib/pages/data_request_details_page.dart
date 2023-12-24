import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/providers/data_request_details_provider.dart';
import 'package:provider/provider.dart';

class DataRequestDetailsPage extends StatefulWidget {
  const DataRequestDetailsPage({super.key});

  static const String dataRequestDetailsPage = 'dataRequestDetailsPage';

  @override
  State<DataRequestDetailsPage> createState() => _DataRequestDetailsPageState();
}

class _DataRequestDetailsPageState extends State<DataRequestDetailsPage> {
  late String reqId;
  bool callOnce = true;
  late DataRequestDetailsProvider dataRequestDetailsProvider;

  @override
  void didChangeDependencies() {
    reqId = ModalRoute.of(context)!.settings.arguments as String;
    dataRequestDetailsProvider = Provider.of(context, listen: true);

    if (callOnce) {
      dataRequestDetailsProvider
          .getDataRequestDetails(reqId, context)
          .then((value) {
        dataRequestDetailsProvider.getDataRequestList();
      });
    }
    callOnce = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Data Request Details Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: dataRequestDetailsProvider.dataRequestDetailsModel == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Name: ${dataRequestDetailsProvider.dataRequestDetailsModel!.userInfo!.name}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Mobile No: ${dataRequestDetailsProvider.dataRequestDetailsModel!.userInfo!.mobileNo}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Email: ${dataRequestDetailsProvider.dataRequestDetailsModel!.userInfo!.email}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Address: ${dataRequestDetailsProvider.dataRequestDetailsModel!.userInfo!.residenceAddress}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Invoice No: ${dataRequestDetailsProvider.dataRequestDetailsModel!.userInfo!.invoiceNo}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dataRequestDetailsProvider
                            .requestedDataInfoList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.blue,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Station Name: ${dataRequestDetailsProvider.requestedDataInfoList[index].stationName}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'Data Type: ${dataRequestDetailsProvider.requestedDataInfoList[index].dataType}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                insetPadding:
                                                    const EdgeInsets.all(10),
                                                backgroundColor: Colors.blue,
                                                title: Center(
                                                  child: Text('Request Details',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .white)),
                                                ),
                                                content: SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.8,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'Data Type: ${dataRequestDetailsProvider.requestedDataInfoList[index].dataType}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Frequency: ${dataRequestDetailsProvider.requestedDataInfoList[index].fName}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Duration: ${dataRequestDetailsProvider.requestedDataInfoList[index].duration}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Date Range: ${dataRequestDetailsProvider.requestedDataInfoList[index].fromDate} - ${dataRequestDetailsProvider.requestedDataInfoList[index].toDate}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'River: ${dataRequestDetailsProvider.requestedDataInfoList[index].riverName}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Upazila: ${dataRequestDetailsProvider.requestedDataInfoList[index].upzlName}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'District: ${dataRequestDetailsProvider.requestedDataInfoList[index].districtName}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Rate: ${dataRequestDetailsProvider.requestedDataInfoList[index].rate}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Quantity: ${dataRequestDetailsProvider.requestedDataInfoList[index].quantity}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Total Amount: ${dataRequestDetailsProvider.requestedDataInfoList[index].totalAmount}',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            height: 50,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Center(
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        15),
                                                                width: 120,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: Colors
                                                                        .white),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                      'Close',
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              Colors.black)),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text('Show more',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Amount: ${dataRequestDetailsProvider.requestedDataInfoList[index].totalAmount}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            'Net Amount(BDT): ${dataRequestDetailsProvider.dataRequestDetailsModel!.userInfo!.grandTotalPrice}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        const SizedBox(
                          height: 3,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('Discount(%)(BDT): ${""}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        const SizedBox(
                          height: 3,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('Additional Charge(%)(BDT): ${""}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        const SizedBox(
                          height: 3,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                            'Payable Amount(BDT): ${dataRequestDetailsProvider.dataRequestDetailsModel!.userInfo!.payablesAmount}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Approve All',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(15),
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Reject All',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
