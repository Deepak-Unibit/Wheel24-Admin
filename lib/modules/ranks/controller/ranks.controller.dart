import 'package:get/get.dart';
import 'package:wheel24_admin/api/call.api.dart';
import 'package:wheel24_admin/api/url.api.dart';
import 'package:wheel24_admin/components/loadingPage/loadingPage.component.dart';
import 'package:wheel24_admin/models/ranks.model.dart';

class RanksController extends GetxController {
  RxList<RanksData> ranksDataList = <RanksData>[].obs;
  
  RanksController() {
    Future.delayed(200.milliseconds, () => getRanks());
  }
  
  getRanks() async {
    LoadingPage.show();
    var resp = await ApiCall.get(UrlApi.getRanks);
    LoadingPage.close();

    RanksModel ranksModel = RanksModel.fromJson(resp);

    if(ranksModel.responseCode == 200) {
      ranksDataList.addAll(ranksModel.data!);
      ranksDataList.refresh();
    }
  }
  
}