import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/api/call.api.dart';
import 'package:wheel24_admin/api/url.api.dart';
import 'package:wheel24_admin/components/loadingPage/loadingPage.component.dart';
import 'package:wheel24_admin/helper/snackBar.helper.dart';
import 'package:wheel24_admin/models/referrals.model.dart';
import 'package:wheel24_admin/models/response.model.dart';
import 'package:wheel24_admin/modules/referrals/view/referrals.view.dart';
import 'package:wheel24_admin/utils/routes.util.dart';
import '../../../models/cashOut.model.dart';

class CashOutController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<CashOutData> cashOutDataList = <CashOutData>[].obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;
  int limit = 20;

  CashOutController() {
    Future.delayed(200.milliseconds, () {
      getCashOutData();
    });
  }

  onPageChanged(int page) {
    if(currentPage.value == page) {
      return;
    }
    currentPage.value = page;
    cashOutDataList.clear();
    cashOutDataList.refresh();
    getCashOutData();
  }

  onSearch() {
    searchController.text = searchController.text.trim();
    currentPage.value = 1;
    cashOutDataList.clear();
    cashOutDataList.refresh();
    getCashOutData();
  }

  getCashOutData() async {
    String url = "${UrlApi.getCashOutRequest}?page=${currentPage.value}&limit=$limit";

    if(searchController.text.isNotEmpty) {
      url += "&search=${searchController.text}";
    }

    LoadingPage.show();
    var resp = await ApiCall.get(url);
    LoadingPage.close();

    CashOutModel cashOutModel = CashOutModel.fromJson(resp);

    if (cashOutModel.responseCode == 200) {
      cashOutDataList.addAll(cashOutModel.data!.value!);
      cashOutDataList.refresh();
      totalPages.value = ((cashOutModel.data?.count??0)/limit).ceil();
    }
    else {
      SnackBarHelper.show(cashOutModel.message);
    }
  }

  onReferralClick(String id, num count) async {
    if(count<=0) {
      SnackBarHelper.show("No Referrals");
      return;
    }

    if (id == "") {
      SnackBarHelper.show("Id Not Found");
      return;
    }
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.getReferrals}/$id?page=1&limit=20");
    LoadingPage.close();

    ReferralsModel referralsModel = ReferralsModel.fromJson(resp);

    if (referralsModel.responseCode == 200) {
      Get.delete<ReferralsModel>();
      Get.put(referralsModel);
      RoutesUtil.to(() => ReferralsView(id: id));
    }
    else {
      SnackBarHelper.show(referralsModel.message);
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
              color: context.theme.colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: context.theme.colorScheme.onSurface.withOpacity(0.25)),
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
                  minWidth: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  visualDensity: VisualDensity.compact,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
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
                  minWidth: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  visualDensity: VisualDensity.compact,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
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

    Get.back();
    ResponseModel responseModel = ResponseModel.fromJson(resp);

    if (responseModel.responseCode == 200) {
      cashOutDataList.clear();
      getCashOutData();
    }
    else {
      SnackBarHelper.show(responseModel.message);
    }
  }
}
