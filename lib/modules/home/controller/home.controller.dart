import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/api/call.api.dart';
import 'package:wheel24_admin/api/url.api.dart';
import 'package:wheel24_admin/components/loadingPage/loadingPage.component.dart';
import 'package:wheel24_admin/models/user.model.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  RxList<UserData> userDataList = <UserData>[].obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;
  RxInt totalCount = 0.obs;
  int limit = 20;

  HomeController() {
    Future.delayed(200.milliseconds, () {
      getUserData();
    });
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

  onRefresh() {
    searchController.clear();
    currentPage.value = 1;
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