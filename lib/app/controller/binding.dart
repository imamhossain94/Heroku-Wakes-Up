import 'package:get/get.dart';

import 'heroku_wake_up_app_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HerokuWakeUpAppController());
  }
}
