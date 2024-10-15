import 'package:get/get.dart';
import 'package:wheel24_admin/models/referrals.model.dart';

class ReferralsController extends GetxController {
  ReferralsModel referralsModel = Get.find<ReferralsModel>();
  RxList<ReferralsData> referralsDataList = <ReferralsData>[].obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;
  int limit = 5;

  ReferralsController() {
    referralsDataList.addAll(referralsModel.data!.value!);
    referralsDataList.refresh();
    totalPages.value = ((referralsModel.data?.count??0)/limit).ceil();

  }

}