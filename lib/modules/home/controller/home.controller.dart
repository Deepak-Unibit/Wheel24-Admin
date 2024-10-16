import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/api/call.api.dart';
import 'package:wheel24_admin/api/url.api.dart';
import 'package:wheel24_admin/components/loadingPage/loadingPage.component.dart';
import 'package:wheel24_admin/components/primaryButton.component.dart';
import 'package:wheel24_admin/helper/snackBar.helper.dart';
import 'package:wheel24_admin/models/blockIP.model.dart';
import 'package:wheel24_admin/models/response.model.dart';
import 'package:wheel24_admin/models/user.model.dart';
import 'package:wheel24_admin/modules/cashOut/view/cashOut.view.dart';
import 'package:wheel24_admin/utils/routes.util.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<UserData> userDataList = <UserData>[].obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;
  RxInt totalCount = 0.obs;
  int limit = 20;
  RxBool isIPRestrict = false.obs;

  HomeController() {
    getIPStatus();
    Future.delayed(200.milliseconds, () {
      getUserData();
    });
  }

  getIPStatus() async {
    var resp = await ApiCall.get(UrlApi.getBlockIPStatus);

    BlockIpModel blockIpModel = BlockIpModel.fromJson(resp);

    if(blockIpModel.responseCode == 200) {
      isIPRestrict.value = blockIpModel.data!;
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
                  "Are you sure want to change IP Restrict?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButtonComponent(onClick: ()=>Get.back(), text: "Cancel", height: 40, width: 80, fontSize: 16, showBorder: true,),
                    PrimaryButtonComponent(onClick: ()=>setIPStatus(value), text: "Confirm", height: 40, width: 80, fontSize: 16,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onPageChanged(int page) {
    if(currentPage.value == page || page<=0) {
      return;
    }
    currentPage.value = page;
    userDataList.clear();
    userDataList.refresh();
    getUserData();
  }

  onSearch() {
    searchController.text = searchController.text.trim();
    currentPage.value = 1;
    userDataList.clear();
    userDataList.refresh();
    getUserData();
  }

  onCashOutClick() {
    RoutesUtil.to(()=>CashOutView());
  }

  getUserData() async {
    String url = UrlApi.getUsers;
    if(searchController.text.isNotEmpty) {
      url += "?search=${searchController.text}&page=${currentPage.value}&limit=$limit";
    }
    else {
      url += "?page=${currentPage.value}&limit=$limit";
    }

    LoadingPage.show();
    var resp = await ApiCall.get(url);
    LoadingPage.close();

    UserModel userModel = UserModel.fromJson(resp);

    if(userModel.responseCode == 200) {
      userDataList.addAll(userModel.data!.value!);
      userDataList.refresh();
      totalCount.value = userModel.data!.count! as int;
      totalPages.value = ((userModel.data?.count??0)/limit).ceil();
    }
  }
}