class UserModel {
  UserModel({
      String? status, 
      String? message, 
      num? responseCode, 
      List<UserData>? data,}){
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
}

  UserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(UserData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _responseCode;
  List<UserData>? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<UserData>? get data => _data;

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

class UserData {
  UserData({
      String? id, 
      String? telegramId, 
      String? firstName, 
      String? lastName, 
      bool? status, 
      num? earnedAmountTemp, 
      num? earnedAmount, 
      num? spinCount, 
      num? referralSpins, 
      String? referralCode, 
      List<String>? referrals, 
      num? referralCount, 
      num? referralCountDue, 
      num? currentSpinRequired, 
      num? cashOutCount, 
      num? payOutCount, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _telegramId = telegramId;
    _firstName = firstName;
    _lastName = lastName;
    _status = status;
    _earnedAmountTemp = earnedAmountTemp;
    _earnedAmount = earnedAmount;
    _spinCount = spinCount;
    _referralSpins = referralSpins;
    _referralCode = referralCode;
    _referrals = referrals;
    _referralCount = referralCount;
    _referralCountDue = referralCountDue;
    _currentSpinRequired = currentSpinRequired;
    _cashOutCount = cashOutCount;
    _payOutCount = payOutCount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UserData.fromJson(dynamic json) {
    _id = json['_id'];
    _telegramId = json['telegramId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _status = json['status'];
    _earnedAmountTemp = json['earnedAmountTemp'];
    _earnedAmount = json['earnedAmount'];
    _spinCount = json['spinCount'];
    _referralSpins = json['referralSpins'];
    _referralCode = json['referralCode'];
    _referrals = json['referrals'] != null ? json['referrals'].cast<String>() : [];
    _referralCount = json['referralCount'];
    _referralCountDue = json['referralCountDue'];
    _currentSpinRequired = json['currentSpinRequired'];
    _cashOutCount = json['cashOutCount'];
    _payOutCount = json['payOutCount'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _telegramId;
  String? _firstName;
  String? _lastName;
  bool? _status;
  num? _earnedAmountTemp;
  num? _earnedAmount;
  num? _spinCount;
  num? _referralSpins;
  String? _referralCode;
  List<String>? _referrals;
  num? _referralCount;
  num? _referralCountDue;
  num? _currentSpinRequired;
  num? _cashOutCount;
  num? _payOutCount;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get telegramId => _telegramId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  bool? get status => _status;
  num? get earnedAmountTemp => _earnedAmountTemp;
  num? get earnedAmount => _earnedAmount;
  num? get spinCount => _spinCount;
  num? get referralSpins => _referralSpins;
  String? get referralCode => _referralCode;
  List<String>? get referrals => _referrals;
  num? get referralCount => _referralCount;
  num? get referralCountDue => _referralCountDue;
  num? get currentSpinRequired => _currentSpinRequired;
  num? get cashOutCount => _cashOutCount;
  num? get payOutCount => _payOutCount;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['telegramId'] = _telegramId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['status'] = _status;
    map['earnedAmountTemp'] = _earnedAmountTemp;
    map['earnedAmount'] = _earnedAmount;
    map['spinCount'] = _spinCount;
    map['referralSpins'] = _referralSpins;
    map['referralCode'] = _referralCode;
    map['referrals'] = _referrals;
    map['referralCount'] = _referralCount;
    map['referralCountDue'] = _referralCountDue;
    map['currentSpinRequired'] = _currentSpinRequired;
    map['cashOutCount'] = _cashOutCount;
    map['payOutCount'] = _payOutCount;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}