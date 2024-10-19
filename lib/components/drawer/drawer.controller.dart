import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/components/drawer/confirmationDialog.component.dart';
import 'package:wheel24_admin/models/settings.model.dart';
import 'package:wheel24_admin/modules/ranks/view/ranks.view.dart';
import '../../api/call.api.dart';
import '../../api/url.api.dart';
import '../../helper/snackBar.helper.dart';
import '../../models/response.model.dart';
import '../../modules/cashOut/view/cashOut.view.dart';
import '../../utils/routes.util.dart';
import '../loadingPage/loadingPage.component.dart';

class DrawerComponentController extends GetxController {

  GlobalKey<ScaffoldState>? scaffoldKey;

  RxBool isIPRestrict = false.obs;
  RxBool isCashReward = false.obs;


  init(GlobalKey<ScaffoldState> scaffoldKey) {
    this.scaffoldKey = scaffoldKey;
    getSettings();
  }

  onCashOutClick() {
    scaffoldKey!.currentState!.closeDrawer();
    RoutesUtil.to(()=>CashOutView());
  }

  onRanksClick() {
    scaffoldKey!.currentState!.closeDrawer();
     RoutesUtil.to(() => RanksView());
  }

  getSettings() async {
    var resp = await ApiCall.get(UrlApi.getSettings);

    SettingsModel settingsModel = SettingsModel.fromJson(resp);

    if(settingsModel.responseCode == 200) {
      isIPRestrict.value = settingsModel.data?.blockIp ?? false;
      isCashReward.value = settingsModel.data?.showExtraCashOffer ?? false;
    }
  }

  setIPStatus(bool value) async {
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.setBlockIPStatus}/${value ? 1 : 0}");
    LoadingPage.close();
    Get.back();
    ResponseModel responseModel = ResponseModel.fromJson(resp);

    if(responseModel.responseCode == 200) {
      isIPRestrict.value = value;
      SnackBarHelper.show(responseModel.message);
    }
    else {
      SnackBarHelper.show(responseModel.message);
    }
  }

  onIPRestrictChange(bool value) {
    ConfirmationDialogComponent.show(onClick: ()=>setIPStatus(value));
  }

  onCashRewardChange(bool value) {
    ConfirmationDialogComponent.show(onClick: ()=>updateCashRewardStatus(value));
  }

  updateCashRewardStatus(bool value) async {
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.updateCashRewardStatus}/${value ? 1 : 0}");
    LoadingPage.close();
    Get.back();
    ResponseModel responseModel = ResponseModel.fromJson(resp);

    if(responseModel.responseCode == 200) {
      isCashReward.value = value;
      SnackBarHelper.show(responseModel.message);
    }
    else {
      SnackBarHelper.show(responseModel.message);
    }
  }

}
