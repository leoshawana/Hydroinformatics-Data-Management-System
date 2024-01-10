import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydroinformatics_data_management_system/models/get_ffwc_data_model.dart';
import 'package:hydroinformatics_data_management_system/models/get_hydro_data_model.dart';
import 'package:hydroinformatics_data_management_system/models/station_info_model.dart';
import 'package:hydroinformatics_data_management_system/services/fetch_station_data_service.dart';
import 'package:hydroinformatics_data_management_system/services/station_info_service.dart';
import 'package:intl/intl.dart';

class StationInfoProvider extends ChangeNotifier {
  StationInfoModel? stationInfoModel;
  List<StationInfo> stationInfo = [];
  List<String> stationName = [];
  dynamic selectedStationKeyword;
  late GetHydroDataModel getHydroDataModel;
  late GetFfwcDataModel getFfwcDataModel;

  Future<void> getStationInfo(String value, context) async {
    print('Value: ${value}');
    stationInfo.clear();
    dynamic data = await StationInfoService.stationInfo(value);
    if (data != null) {
      stationInfoModel = StationInfoModel.fromJson(data);
      stationInfoModel!.stationInfo!.forEach((element) {
        stationInfo.add(element);
      });

      if (value == 'GW') {
        dynamic info = await FetchStationDataService.fetchHydroData(
            stationInfo[0].keyword,
            DateFormat('dd-MM-yyyy').format(DateTime.now()));

        if (info != null) {
          getHydroDataModel = GetHydroDataModel.fromJson(info);
          print('Value: ${getHydroDataModel.value}');
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Something went wrong'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text('OK'))
                  ],
                );
              });
        }
      }

      if (value == 'RF' || value == 'WL') {
        dynamic info = await FetchStationDataService.fetchFfwcData(
            stationInfo[0].keyword,
            DateFormat('dd-MM-yyyy').format(DateTime.now()));

        if (info != null) {
          getFfwcDataModel = GetFfwcDataModel.fromJson(info);
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Something went wrong'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text('OK'))
                  ],
                );
              });
        }
      }
    } else {
      print('Something went wrong');
    }
  }

  getStationName() {
    stationName.clear();
    stationInfo.forEach((element) {
      stationName.add(element.stationName!);
    });
  }

  String getStationKeyword(selectedStation) {
    stationInfoModel!.stationInfo!.forEach((element) {
      if (element.stationName == selectedStation) {
        selectedStationKeyword = element.keyword;
      }
    });
    return selectedStationKeyword;
  }
}
