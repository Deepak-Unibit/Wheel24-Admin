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
  RxInt totalCount = 0.obs;
  int limit = 20;

  init(String id) {
    this.id = id;
    referralsDataList.addAll(referralsModel.data!.value!);
    referralsDataList.refresh();
    totalCount.value = referralsModel.data!.count! as int;
    totalPages.value = ((referralsModel.data?.count??0)/limit).ceil();
  }

  onPageChanged(int page) {
    if(currentPage.value == page || page<=0) {
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
    ReferralsModel referralsModel = ReferralsModel.fromJson(resp);

    if (referralsModel.responseCode == 200) {
      referralsDataList.addAll(referralsModel.data!.value!);
      referralsDataList.refresh();
      totalCount.value = referralsModel.data!.count! as int;
      totalPages.value = ((referralsModel.data?.count??0)/limit).ceil();
    }
  }

}