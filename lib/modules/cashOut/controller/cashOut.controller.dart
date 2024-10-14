import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/api/call.api.dart';
import 'package:wheel24_admin/api/url.api.dart';
import 'package:wheel24_admin/components/loadingPage/loadingPage.component.dart';
import 'package:wheel24_admin/models/cashout.model.dart';
import 'package:wheel24_admin/models/referrals.model.dart';
import 'package:wheel24_admin/models/response.model.dart';
import 'package:wheel24_admin/modules/referrals/view/referrals.view.dart';
import 'package:wheel24_admin/utils/routes.util.dart';

class CashOutController extends GetxController {
  RxList<CashOutData> cashOutDataList = <CashOutData>[].obs;

  CashOutController() {
    Future.delayed(200.milliseconds, () {
      getCashOutData();
    });
  }

  getCashOutData() async {
    LoadingPage.show();
    var resp = await ApiCall.get(UrlApi.getCashOutRequest);
    LoadingPage.close();
    print(resp);

    CashoutModel cashoutModel = CashoutModel.fromJson(resp);

    if (cashoutModel.responseCode == 200) {
      cashOutDataList.addAll(cashoutModel.data!);
      cashOutDataList.refresh();
    }
  }

  onReferralClick(String id) async {
    if (id == "") {
      return;
    }
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.getReferrals}/$id");
    LoadingPage.close();

    ReferralsModel referralsModel = ReferralsModel.fromJson(resp);

    if (referralsModel.responseCode == 200) {
      List<ReferralsData> referralsData = referralsModel.data!;
      Get.delete<List<ReferralsData>>();
      Get.put(referralsData);
      RoutesUtil.to(() => ReferralsView());
    }
  }

  onStatusClick(String id) {
    if (id == "") {
      return;
    }
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        backgroundColor: Colors.black.withOpacity(0.25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onSurface.withOpacity(0.05),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: context.theme.colorScheme.onSurface.withOpacity(0.25)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: MaterialButton(
                    onPressed: () => Get.back(),
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                Text(
                  "Change Status",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  onPressed: () => onStatusChange(id, 1),
                  minWidth: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  visualDensity: VisualDensity.compact,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.green,
                  child: Text(
                    "Approve",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () => onStatusChange(id, 0),
                  minWidth: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  visualDensity: VisualDensity.compact,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.red,
                  child: Text(
                    "Reject",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onStatusChange(String id, int status) async {
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.updateCashOutRequest}/$id/$status");
    LoadingPage.close();

    print(resp);
    Get.back();
    ResponseModel responseModel = ResponseModel.fromJson(resp);

    if (responseModel.responseCode == 200) {
      cashOutDataList.clear();
      getCashOutData();
    }
  }
}
