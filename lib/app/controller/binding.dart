import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HerokuWakeUpController());
  }
}
