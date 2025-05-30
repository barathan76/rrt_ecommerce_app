import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String> deviceId() async {
  String? device;
  try {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      device = androidDeviceInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      device = iosDeviceInfo.utsname.machine;
    }
  } catch (e) {
    device = 'unknown device';
  }
  return device!;
}
