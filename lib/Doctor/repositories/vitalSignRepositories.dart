import 'dart:async';
import 'package:ayur360_app/Doctor/models/vitalSignMode.dart';
import 'package:ayur360_app/HomeScreen/DoctorLoginRepository/DrLoginApi.dart';

import '../../Updater/network/webApiProvider.dart';



class VitalSignRepository {
  Future<List<VitalSignModel>> getVitalsign() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>
    {
      "clinicId":1,"userIds":userid,"pageNo":0,"rowCount":10
    };
    print("_queryParameters : "+_queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "chart/patientdata/virtualSignList",
        isPost:  true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("response->${response}");
    return (response as List).map((x) => VitalSignModel.fromJson(x)).toList();
  }
}