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
