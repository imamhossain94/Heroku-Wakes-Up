import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';

GetStorage box = GetStorage();

String getAppVersion() {
  return box.read("version") ?? "";
}
void setAppVersion() async {
  String version = "";
  await PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    version =  packageInfo.version;
  });
  box.write("version", version);
}
