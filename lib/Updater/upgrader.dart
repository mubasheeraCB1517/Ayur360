import 'dart:convert';
import 'dart:io';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;

import '../Constants.dart';

// Future<String> getVersionCode() async {
//   try{
//     await DeviceInfo().init();
//     await PackageInfos().init();
//
//     var client = http.Client();
//     final myTranformer = Xml2Json();
//     Uri urls = Uri.https(baseUrl, 'appconfig.xml');
//
//     return await client.get(urls).then((response) {
//       return response.body;
//     }).then((bodyString) {
//       myTranformer.parse(bodyString);
//       var json = myTranformer.toGData();
//       // print("sssss "+jsonDecode(json).toString());
//       String versionCode = "0";
//       if (Platform.isAndroid) {
//         versionCode = int.parse(jsonDecode(json)['update']['versionCodeAndroid']
//             .toString()
//             .replaceAll(RegExp('[^0-9]'), ''))
//             .toString();
//       } else if (Platform.isIOS) {
//         versionCode = int.parse(jsonDecode(json)['update']['versionCodeios']
//             .toString()
//             .replaceAll(RegExp('[^0-9]'), ''))
//             .toString();
//       }
//
//       return versionCode;
//     });
//   }
//   catch(ex )
//   {
//     return "0";
//   }
// }
//
// class update {
//   String versionCodeAndroid;
//   String versionCodeios;
//
//   update(
//       {required this.versionCodeAndroid,
//         required this.versionCodeios
//       });
//
//   factory update.fromJson(Map<String, dynamic> json) {
//     return update(
//         versionCodeAndroid: json['versionCodeAndroid'],
//         versionCodeios: json['versionCodeios'],
//        );
//   }
Future<String> getVersionCode() async {
  try {
    var client = http.Client();
    final myTranformer = Xml2Json();
    Uri urls = Uri.https(baseUrl, 'appconfig.xml');

    return await client.get(urls).then((response) {
      return response.body;
    }).then((bodyString) {
      myTranformer.parse(bodyString);
      var json = myTranformer.toGData();
      // print("sssss "+jsonDecode(json).toString());
      String versionCode = "0";
      String showHideRegistration = "0";
      if (Platform.isAndroid) {
        versionCode = int.parse(jsonDecode(json)['update']['versionCodeAndroid']
            .toString()
            .replaceAll(RegExp('[^0-9]'), ''))
            .toString();

      } else if (Platform.isIOS) {
        versionCode = int.parse(jsonDecode(json)['update']['versionCodeios']
            .toString()
            .replaceAll(RegExp('[^0-9]'), ''))
            .toString();

      }
      print("showHideRegistration : " + showHideRegistration);

      return versionCode;
    });
  } catch (ex) {
    print("showHideRegistration : errror " + ex.toString());
    return "0";
  }
}

class update {
  String? versionCodeAndroid;
  String? versionCodeios;
  String? maxBookAndroid;
  String? maxBookios;

  update(
      {this.versionCodeAndroid,
        this.versionCodeios,
        this.maxBookAndroid,
        this.maxBookios});

  factory update.fromJson(Map<String, dynamic> json) {
    return update(
        versionCodeAndroid: json['versionCodeAndroid'],
        versionCodeios: json['versionCodeios'],
        maxBookAndroid: json['maxBookAndroid'],
        maxBookios: json['maxBookios']);
  }
}
