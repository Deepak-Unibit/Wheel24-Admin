import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/api/call.api.dart';
import 'package:wheel24_admin/api/url.api.dart';
import 'package:wheel24_admin/components/loadingPage/loadingPage.component.dart';
import 'package:wheel24_admin/models/user.model.dart';
import 'package:wheel24_admin/modules/cashOut/view/cashOut.view.dart';
import 'package:wheel24_admin/utils/routes.util.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<UserData> userDataList = <UserData>[].obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;
  int limit = 5;

  HomeController() {
    Future.delayed(200.milliseconds, () => getUserData());
  }

  onPageChanged(int page) {
    if(currentPage.value == page) {
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

    print("${UrlApi.getUsers}?page=${currentPage.value}&limit=$limit");

    UserModel userModel = UserModel.fromJson(resp);

    if(userModel.responseCode == 200) {
      userDataList.addAll(userModel.data!.value!);
      userDataList.refresh();
      totalPages.value = ((userModel.data?.count??0)/limit).ceil();
    }
  }
}