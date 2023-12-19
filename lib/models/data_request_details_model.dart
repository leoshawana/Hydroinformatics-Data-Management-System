/// status : "success"
/// data_request_info : [{"name":"Shawana Mobashsera","mobile_no":"01367009929","email":"smobashsera@gmail.com","residence_address":"BWDB#1","user_type_name":"Individuals","invoice_no":"562270","grand_total_price":"60","payables_amount":"60"}]

class DataRequestDetailsModel {
  DataRequestDetailsModel({
      String? status, 
      List<DataRequestInfo>? dataRequestInfo,}){
    _status = status;
    _dataRequestInfo = dataRequestInfo;
}

  DataRequestDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data_request_info'] != null) {
      _dataRequestInfo = [];
      json['data_request_info'].forEach((v) {
        _dataRequestInfo?.add(DataRequestInfo.fromJson(v));
      });
    }
  }
  String? _status;
  List<DataRequestInfo>? _dataRequestInfo;
DataRequestDetailsModel copyWith({  String? status,
  List<DataRequestInfo>? dataRequestInfo,
}) => DataRequestDetailsModel(  status: status ?? _status,
  dataRequestInfo: dataRequestInfo ?? _dataRequestInfo,
);
  String? get status => _status;
  List<DataRequestInfo>? get dataRequestInfo => _dataRequestInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_dataRequestInfo != null) {
      map['data_request_info'] = _dataRequestInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Shawana Mobashsera"
/// mobile_no : "01367009929"
/// email : "smobashsera@gmail.com"
/// residence_address : "BWDB#1"
/// user_type_name : "Individuals"
/// invoice_no : "562270"
/// grand_total_price : "60"
/// payables_amount : "60"

class DataRequestInfo {
  DataRequestInfo({
      String? name, 
      String? mobileNo, 
      String? email, 
      String? residenceAddress, 
      String? userTypeName, 
      String? invoiceNo, 
      String? grandTotalPrice, 
      String? payablesAmount,}){
    _name = name;
    _mobileNo = mobileNo;
    _email = email;
    _residenceAddress = residenceAddress;
    _userTypeName = userTypeName;
    _invoiceNo = invoiceNo;
    _grandTotalPrice = grandTotalPrice;
    _payablesAmount = payablesAmount;
}

  DataRequestInfo.fromJson(dynamic json) {
    _name = json['name'];
    _mobileNo = json['mobile_no'];
    _email = json['email'];
    _residenceAddress = json['residence_address'];
    _userTypeName = json['user_type_name'];
    _invoiceNo = json['invoice_no'];
    _grandTotalPrice = json['grand_total_price'];
    _payablesAmount = json['payables_amount'];
  }
  String? _name;
  String? _mobileNo;
  String? _email;
  String? _residenceAddress;
  String? _userTypeName;
  String? _invoiceNo;
  String? _grandTotalPrice;
  String? _payablesAmount;
DataRequestInfo copyWith({  String? name,
  String? mobileNo,
  String? email,
  String? residenceAddress,
  String? userTypeName,
  String? invoiceNo,
  String? grandTotalPrice,
  String? payablesAmount,
}) => DataRequestInfo(  name: name ?? _name,
  mobileNo: mobileNo ?? _mobileNo,
  email: email ?? _email,
  residenceAddress: residenceAddress ?? _residenceAddress,
  userTypeName: userTypeName ?? _userTypeName,
  invoiceNo: invoiceNo ?? _invoiceNo,
  grandTotalPrice: grandTotalPrice ?? _grandTotalPrice,
  payablesAmount: payablesAmount ?? _payablesAmount,
);
  String? get name => _name;
  String? get mobileNo => _mobileNo;
  String? get email => _email;
  String? get residenceAddress => _residenceAddress;
  String? get userTypeName => _userTypeName;
  String? get invoiceNo => _invoiceNo;
  String? get grandTotalPrice => _grandTotalPrice;
  String? get payablesAmount => _payablesAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['mobile_no'] = _mobileNo;
    map['email'] = _email;
    map['residence_address'] = _residenceAddress;
    map['user_type_name'] = _userTypeName;
    map['invoice_no'] = _invoiceNo;
    map['grand_total_price'] = _grandTotalPrice;
    map['payables_amount'] = _payablesAmount;
    return map;
  }

}