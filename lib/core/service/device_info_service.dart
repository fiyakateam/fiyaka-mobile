import 'dart:io' show Platform;

import 'package:device_info/device_info.dart';

class DeviceInfoService {
  final String _deviceId;

  DeviceInfoService._(this._deviceId);

  String get deviceId => _deviceId;

  static Future<DeviceInfoService> create() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return DeviceInfoService._(iosDeviceInfo.identifierForVendor);
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return DeviceInfoService._(androidDeviceInfo.androidId);
    } else {
      print('Should not reach here?');
      assert(false);
      return null;
    }
  }
}
