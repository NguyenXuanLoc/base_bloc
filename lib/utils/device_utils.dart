import 'dart:io';
import 'package:device_info/device_info.dart';

import '../data/globals.dart';


class DeviceUtils {
  DeviceUtils._();

  static Future<void> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var android = await deviceInfo.androidInfo;
      deviceModel = android.model.toString();
      deviceId = android.androidId.toString();
      deviceName = android.model.toString();
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      deviceModel = iosInfo.localizedModel.toString();
      deviceName = iosInfo.systemName.toString();
      deviceId = iosInfo.identifierForVendor.toString();
    }
  }
}
