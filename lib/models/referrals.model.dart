class ReferralsModel {
  ReferralsModel({
      String? status, 
      String? message, 
      num? responseCode, 
      Data? data,}){
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
}

  ReferralsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  Data? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  Data? get data => _data;

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

class Data {
  Data({
      List<ReferralsData>? value,
      num? count,}){
    _value = value;
    _count = count;
}

  Data.fromJson(dynamic json) {
    if (json['value'] != null) {
      _value = [];
      json['value'].forEach((v) {
        _value?.add(ReferralsData.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<ReferralsData>? _value;
  num? _count;

  List<ReferralsData>? get value => _value;
  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_value != null) {
      map['value'] = _value?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
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