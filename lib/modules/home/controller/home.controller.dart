import 'package:get/get.dart';
import 'package:wheel24_admin/api/call.api.dart';
import 'package:wheel24_admin/api/url.api.dart';
import 'package:wheel24_admin/components/loadingPage/loadingPage.component.dart';
import 'package:wheel24_admin/models/user.model.dart';
import 'package:wheel24_admin/modules/cashOut/view/cashOut.view.dart';
import 'package:wheel24_admin/utils/routes.util.dart';

class HomeController extends GetxController {
  RxList<UserData> userDataList = <UserData>[].obs;

  HomeController() {
    Future.delayed(200.milliseconds, () => getUserData());
  }

  onCashOutClick() {
    RoutesUtil.to(()=>CashOutView());
  }

  getUserData() async {
    LoadingPage.show();
    var resp = await ApiCall.get(UrlApi.getUsers);
    LoadingPage.close();

    UserModel userModel = UserModel.fromJson(resp);

    if(userModel.responseCode == 200) {
      userDataList.addAll(userModel.data!);
      userDataList.refresh();
    }
  }
}