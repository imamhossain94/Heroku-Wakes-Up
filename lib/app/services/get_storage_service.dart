import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

GetStorage box = GetStorage();

String appVersion() {
  return box.read('version') ?? '1.0.0';
}
void setAppVersion() async {
  await PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    box.write('version',  packageInfo.version);
  });

}

bool isFirstLaunch() {
  return box.read("first_launch") ?? true;
}
void setFirstLaunch() async {
  box.write("first_launch", false);
}

bool isBackgroundFetchRunning() {
  return box.read("bg_fetch_status") ?? false;
}
void setBackgroundFetchRunningStatus(bool value) async {
  box.write("bg_fetch_status", value);
}

int getEventCounter() {
  return box.read("event_counter") ?? 100;
}
void setEventCounter() async {
  int counter = getEventCounter();
  box.write("event_counter", counter++);
}
