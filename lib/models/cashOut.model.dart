class CashOutModel {
  CashOutModel({
      String? status, 
      String? message, 
      num? responseCode, 
      Data? data,}){
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
}

  CashOutModel.fromJson(dynamic json) {
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
      List<CashOutData>? value,
      num? count,}){
    _value = value;
    _count = count;
}

  Data.fromJson(dynamic json) {
    if (json['value'] != null) {
      _value = [];
      json['value'].forEach((v) {
        _value?.add(CashOutData.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<CashOutData>? _value;
  num? _count;

  List<CashOutData>? get value => _value;
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

class CashOutData {
  CashOutData({
      String? id, 
      String? userId, 
      num? status, 
      num? amount, 
      String? telegramId, 
      String? firstName, 
      num? referralCount, 
      String? accountHolderName, 
      String? phoneNumber, 
      String? upiId,}){
    _id = id;
    _userId = userId;
    _status = status;
    _amount = amount;
    _telegramId = telegramId;
    _firstName = firstName;
    _referralCount = referralCount;
    _accountHolderName = accountHolderName;
    _phoneNumber = phoneNumber;
    _upiId = upiId;
}

  CashOutData.fromJson(dynamic json) {
    _id = json['_id'];
    _userId = json['userId'];
    _status = json['status'];
    _amount = json['amount'];
    _telegramId = json['telegramId'];
    _firstName = json['firstName'];
    _referralCount = json['referralCount'];
    _accountHolderName = json['accountHolderName'];
    _phoneNumber = json['phoneNumber'];
    _upiId = json['upiId'];
  }
  String? _id;
  String? _userId;
  num? _status;
  num? _amount;
  String? _telegramId;
  String? _firstName;
  num? _referralCount;
  String? _accountHolderName;
  String? _phoneNumber;
  String? _upiId;

  String? get id => _id;
  String? get userId => _userId;
  num? get status => _status;
  num? get amount => _amount;
  String? get telegramId => _telegramId;
  String? get firstName => _firstName;
  num? get referralCount => _referralCount;
  String? get accountHolderName => _accountHolderName;
  String? get phoneNumber => _phoneNumber;
  String? get upiId => _upiId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userId'] = _userId;
    map['status'] = _status;
    map['amount'] = _amount;
    map['telegramId'] = _telegramId;
    map['firstName'] = _firstName;
    map['referralCount'] = _referralCount;
    map['accountHolderName'] = _accountHolderName;
    map['phoneNumber'] = _phoneNumber;
    map['upiId'] = _upiId;
    return map;
  }

}