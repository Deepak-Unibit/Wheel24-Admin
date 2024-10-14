class ReferralsModel {
  ReferralsModel({
      String? status, 
      String? message, 
      num? responseCode, 
      List<ReferralsData>? data,}){
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
}

  ReferralsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ReferralsData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _responseCode;
  List<ReferralsData>? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<ReferralsData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['responseCode'] = _responseCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ReferralsData {
  ReferralsData({
      String? id, 
      String? telegramId, 
      String? firstName,}){
    _id = id;
    _telegramId = telegramId;
    _firstName = firstName;
}

  ReferralsData.fromJson(dynamic json) {
    _id = json['_id'];
    _telegramId = json['telegramId'];
    _firstName = json['firstName'];
  }
  String? _id;
  String? _telegramId;
  String? _firstName;

  String? get id => _id;
  String? get telegramId => _telegramId;
  String? get firstName => _firstName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['telegramId'] = _telegramId;
    map['firstName'] = _firstName;
    return map;
  }

}