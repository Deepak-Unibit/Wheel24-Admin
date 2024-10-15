import 'package:get/get.dart';
import 'package:wheel24_admin/models/referrals.model.dart';

import '../../../api/call.api.dart';
import '../../../api/url.api.dart';
import '../../../components/loadingPage/loadingPage.component.dart';

class ReferralsController extends GetxController {
  ReferralsModel referralsModel = Get.find<ReferralsModel>();
  RxList<ReferralsData> referralsDataList = <ReferralsData>[].obs;
  String id = "";
  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;
  int limit = 10;

  init(String id) {
    this.id = id;
    referralsDataList.addAll(referralsModel.data!.value!);
    referralsDataList.refresh();
    totalPages.value = ((referralsModel.data?.count??0)/limit).ceil();
  }

  onPageChanged(int page) {
    if(currentPage.value == page) {
      return;
    }
    currentPage.value = page;
    referralsDataList.clear();
    referralsDataList.refresh();
    getReferrals();
  }

  getReferrals() async {
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.getReferrals}/$id?page=${currentPage.value}&limit=$limit");
    LoadingPage.close();

    print(resp);

    ReferralsModel referralsModel = ReferralsModel.fromJson(resp);

    if (referralsModel.responseCode == 200) {
      referralsDataList.addAll(referralsModel.data!.value!);
      referralsDataList.refresh();
      totalPages.value = ((referralsModel.data?.count??0)/limit).ceil();
      print(referralsDataList[0].firstName);
    }
  }

}