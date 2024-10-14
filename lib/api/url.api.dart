import 'app.const.dart';

class UrlApi {
  static const String baseUrl = AppConst.baseUrl;

  // Admin
  static const getCashOutRequest = "$baseUrl/admin/cash-out-requests";
  static const getReferrals = "$baseUrl/admin/users-referrals";
  static const updateCashOutRequest = "$baseUrl/admin/update-cash-out-request";

}
