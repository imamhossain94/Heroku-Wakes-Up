import 'package:get/get.dart';
import 'package:heroku_wake_up/app/model/heroku_app.dart';

import '../services/hive_helper.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;

  var appList = <HerokuApp>[].obs;

  @override
  void onInit() {
    fetchApps();
    super.onInit();
  }

  void fetchApps() {
    isLoading(true);
    appList.value = getAppList();
    isLoading(false);
  }
}
