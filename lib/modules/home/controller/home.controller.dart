import 'package:get/get.dart';
import 'package:wheel24_admin/api/call.api.dart';
import 'package:wheel24_admin/api/url.api.dart';
import 'package:wheel24_admin/components/loadingPage/loadingPage.component.dart';
import 'package:wheel24_admin/models/user.model.dart';
import 'package:wheel24_admin/modules/cashOut/view/cashOut.view.dart';
import 'package:wheel24_admin/utils/routes.util.dart';

class HomeController extends GetxController {
  RxList<UserData> userDataList = <UserData>[].obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;
  int limit = 5;

  HomeController() {
    Future.delayed(200.milliseconds, () => getUserData());
  }

  onPageChanged(int page) {
    currentPage.value = page;
    userDataList.clear();
    userDataList.refresh();
    getUserData();
  }

  onCashOutClick() {
    RoutesUtil.to(()=>CashOutView());
  }

  getUserData() async {
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.getUsers}?page=${currentPage.value}&limit=$limit");
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