import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/custom/drawer.dart';
import 'package:hydroinformatics_data_management_system/pages/data_selection_page.dart';
import 'package:hydroinformatics_data_management_system/pages/ground_water_page.dart';
import 'package:hydroinformatics_data_management_system/pages/rainfall_page.dart';
import 'package:hydroinformatics_data_management_system/pages/surface_water_page.dart';
import 'package:hydroinformatics_data_management_system/pages/user_registration_page.dart';
import 'package:hydroinformatics_data_management_system/providers/login_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/station_info_provider.dart';
import 'package:provider/provider.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  static const String servicesPage = 'servicesPage';

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late LoginProvider loginProvider;
  late StationInfoProvider stationInfoProvider;

  @override
  void didChangeDependencies() {
    loginProvider = Provider.of(context, listen: true);
    stationInfoProvider = Provider.of(context, listen: true);
    loginProvider.getServiceInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF64B5F6),
      drawer: HomePageDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Service Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: loginProvider.serviceInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 120,
                      child: InkWell(
                        onTap: () {
                          EasyLoading.show();
                          if (loginProvider.serviceInfo[index].data! == "WL") {
                            stationInfoProvider
                                .getStationInfo(
                                    loginProvider.serviceInfo[index].data!,
                                    context)
                                .then((value) {
                              EasyLoading.dismiss();
                              Navigator.of(context).pushNamed(
                                  DataSelectionPage.dataSelectionPage,
                                  arguments:
                                      loginProvider.serviceInfo[index].data!);
                            });
                          }

                          if (loginProvider.serviceInfo[index].data! == "RF") {
                            stationInfoProvider
                                .getStationInfo(
                                    loginProvider.serviceInfo[index].data!,
                                    context)
                                .then((value) {
                              EasyLoading.dismiss();
                              Navigator.of(context).pushNamed(
                                  DataSelectionPage.dataSelectionPage,
                                  arguments:
                                      loginProvider.serviceInfo[index].data!);
                            });
                          }

                          if (loginProvider.serviceInfo[index].data! == "GW") {
                            stationInfoProvider
                                .getStationInfo(
                                    loginProvider.serviceInfo[index].data!,
                                    context)
                                .then((value) {
                              EasyLoading.dismiss();
                              Navigator.of(context).pushNamed(
                                  DataSelectionPage.dataSelectionPage,
                                  arguments:
                                      loginProvider.serviceInfo[index].data!);
                            });
                          }

                          if (loginProvider.serviceInfo[index].data! == "UR") {
                            stationInfoProvider
                                .getStationInfo(
                                    loginProvider.serviceInfo[index].data!,
                                    context)
                                .then((value) {
                              EasyLoading.dismiss();
                              Navigator.of(context).pushNamed(
                                  UserRegistrationPage.userRegistrationPage);
                            });
                          }
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 40,
                                    child: Image.network(loginProvider
                                        .serviceInfo[index].icon!)),
                                FittedBox(
                                  child: Text(
                                      loginProvider.serviceInfo[index].type!,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
