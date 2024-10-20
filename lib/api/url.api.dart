import 'app.const.dart';

class UrlApi {
  static const String baseUrl = AppConst.baseUrl;

  // Admin
  static const getUsers = "$baseUrl/admin/users";
  static const getCashOutRequest = "$baseUrl/admin/cash-out-requests";
  static const getReferrals = "$baseUrl/admin/users-referrals";
  static const updateCashOutRequest = "$baseUrl/admin/update-cash-out-request";
  static const getSettings = "$baseUrl/admin/settings";
  static const setBlockIPStatus = "$baseUrl/admin/block-ip";
  static const getRanks = "$baseUrl/admin/rankers";
  static const updateCashRewardStatus = "$baseUrl/admin/extra-cash-status";

}
