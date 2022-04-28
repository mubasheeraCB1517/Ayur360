import 'dart:async';

import 'package:ayur360_app/Doctor/models/labTestModel.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/HomeScreen/DoctorLoginRepository/DrLoginApi.dart';

import '../../Updater/network/webApiProvider.dart';

class LabtestRepository {
  Future<List<Labtest>> getlabTest() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "clinicId": 1,
      "pageNo": 0,
      "rowCount": 10,
      "userIds": userid
    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "chart/lab/list",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("response->${response}");
    return (response as List).map((x) => Labtest.fromJson(x)).toList();
  }
}
