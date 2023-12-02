import 'package:flutter/material.dart';
import 'package:hydroinformatics_data_management_system/models/hydro_graph_model.dart';

import '../services/graph_service.dart';

class GraphProvider extends ChangeNotifier {
  HydroGraphModel? hydroGraphModel;
  List<Data> dataList = [];

  Future<void> showHydroGraph(keyword, fromDate, toDate, context) async {
    await GraphService.hydroGraphInfo(keyword, fromDate, toDate).then((value) {
      dataList.clear();
      if (value != null) {
        if (value['status'] == 'success') {
          hydroGraphModel = HydroGraphModel.fromJson(value);
          hydroGraphModel!.data!.forEach((element) {
            dataList.add(element);
          });
          notifyListeners();
        } else {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(value['status']),
              content: Text(value['message']),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: const Text('Oops! Something went wrong'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }
}
