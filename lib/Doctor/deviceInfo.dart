
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
class DeviceInfo
{

  static final DeviceInfo _instance = DeviceInfo._internal();
  factory DeviceInfo() => _instance;
  DeviceInfo._internal();

  late AndroidDeviceInfo _androidDeviceInfo;
  late IosDeviceInfo _iosDeviceInfo;

  //factory DeviceInfo() => DeviceInfo._internal();

  //DeviceInfo._internal();

  Future<void> init() async {
    DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        _androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      } else if (Platform.isIOS) {
        _iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  //
  String? get deviceName => Platform.isAndroid? _androidDeviceInfo.model: _iosDeviceInfo.name;
  String? get deviceVersion  => Platform.isAndroid? _androidDeviceInfo.version.toString(): _iosDeviceInfo.systemVersion;
  String? get identifier  => Platform.isAndroid? _androidDeviceInfo.androidId: _iosDeviceInfo.identifierForVendor;
  String? get deviceBrand  => Platform.isAndroid? _androidDeviceInfo.brand: _iosDeviceInfo.model;
  String? get deviceManufaturer  => Platform.isAndroid? _androidDeviceInfo.manufacturer: _iosDeviceInfo.systemName;
  String? get isPhysicalDevice  => Platform.isAndroid? _androidDeviceInfo.isPhysicalDevice.toString(): _iosDeviceInfo.isPhysicalDevice.toString();

}

class PackageInfos
{
  static final PackageInfos _instance = PackageInfos._internal();
  factory PackageInfos() => _instance;
  PackageInfos._internal();

  late PackageInfo _packageInfos;
  late IosDeviceInfo _iosDeviceInfo;

  //factory PackageInfos() => PackageInfos._internal();

  //PackageInfos._internal();

  Future<void> init() async {
    _packageInfos = await PackageInfo.fromPlatform();
  }
  //
  String get appName => _packageInfos.appName;
  String get buildNumber  => _packageInfos.buildNumber;
  String get packageName  => _packageInfos.packageName;
  String get version  => _packageInfos.version;

}