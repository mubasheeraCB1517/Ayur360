import 'dart:async';

import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/Doctor/models/myAppointmentsModel.dart';
import 'package:ayur360_app/HomeScreen/DoctorLoginRepository/DrLoginApi.dart';

import '../../Updater/network/webApiProvider.dart';
import '../hiveshareperfrence.dart';


class MyAppointmentListRepository {
  Future<List<myAppointment>> getAppointmentList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>
    {

      "userIds":userid,
      "pageNo":0,
      "rowCount":10
    };
    print("_queryParameters : "+_queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "chart/appointments/listByDoctor/0",
        isPost:  true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return (response as List).map((x) => myAppointment.fromJson(x)).toList();
  }
}