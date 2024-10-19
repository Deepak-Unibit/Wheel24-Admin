class SettingsModel {
  SettingsModel({
      String? status, 
      String? message, 
      num? responseCode, 
      SettingsData? data,}){
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
}

  SettingsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? SettingsData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  SettingsData? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  SettingsData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['responseCode'] = _responseCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class SettingsData {
  SettingsData({
      String? id, 
      bool? blockIp, 
      bool? showExtraCashOffer,}){
    _id = id;
    _blockIp = blockIp;
    _showExtraCashOffer = showExtraCashOffer;
}

  SettingsData.fromJson(dynamic json) {
    _id = json['_id'];
    _blockIp = json['blockIp'];
    _showExtraCashOffer = json['showExtraCashOffer'];
  }
  String? _id;
  bool? _blockIp;
  bool? _showExtraCashOffer;

  String? get id => _id;
  bool? get blockIp => _blockIp;
  bool? get showExtraCashOffer => _showExtraCashOffer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['blockIp'] = _blockIp;
    map['showExtraCashOffer'] = _showExtraCashOffer;
    return map;
  }

}