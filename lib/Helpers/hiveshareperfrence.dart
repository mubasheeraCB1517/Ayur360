import 'package:hive/hive.dart';

class HiveSharedPrefs {

  static final HiveSharedPrefs _instance = HiveSharedPrefs._internal();

  factory HiveSharedPrefs() => _instance;

  HiveSharedPrefs._internal();

  static const _preferencesBox = '_userBox';

  late final Box<dynamic> _box;

  Future<void> init() async {
    _box = await Hive.openBox<dynamic>(_preferencesBox);
  }
  String get userName =>_box.get("userName", defaultValue: "") ;
  set userName(String value) {
    _box.put("userName", value);
  }
  //loginusername
  String get loginusername =>_box.get("loginusername", defaultValue: "") ;
  set loginusername(String value) {
    _box.put("loginusername", value);
  }

  //loginpwd
  String get loginpwd =>_box.get("loginpwd", defaultValue: "") ;
  set loginpwd(String value) {
    _box.put("loginpwd", value);
  }

  //accessToken
  String get accessToken =>_box.get("accessToken", defaultValue: "") ;
  set accessToken(String value) {
    _box.put("accessToken", value);
  }
  //refreshToken
  String get refreshToken =>_box.get("refreshToken", defaultValue: "") ;
  set refreshToken(String value) {
    _box.put("refreshToken", value);
  }
  //userId
  String get userId =>_box.get("userId", defaultValue: "") ;
  set userId(String value) {
    _box.put("userId", value);
  }
  String get tokenExpiryTime =>_box.get("tokenExpiryTime", defaultValue: "") ;
  set tokenExpiryTime(String value) {
    _box.put("tokenExpiryTime", value);
  }
}