import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaterLevelAvailabilitySearchPage extends StatefulWidget {
  const WaterLevelAvailabilitySearchPage({super.key});

  static const waterLevelAvailabilitySearchPage =
      'waterLevelAvailabilitySearchPage';

  @override
  State<WaterLevelAvailabilitySearchPage> createState() =>
      _WaterLevelAvailabilitySearchPageState();
}

class _WaterLevelAvailabilitySearchPageState
    extends State<WaterLevelAvailabilitySearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Water Level Availability Search Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownSearch<String>(
                items: [],
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
                dropdownButtonProps: const DropdownButtonProps(
                  color: Colors.black,
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlignVertical: TextAlignVertical.center,
                  dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 8),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1))),
                ),
                onChanged: (value) {},
                selectedItem: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
