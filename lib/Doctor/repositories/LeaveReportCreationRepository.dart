import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/cupertino.dart';
import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';


class LeaveReportRepository {
  getLeaveeport(String eventsName, String eventsDate, String timeDurationFrom,
      String timeDurationTo, context, int listId) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "eventsId": listId,
      "eventsName": eventsName,
      "eventsDate": eventsDate,
      "timeDurationFrom": timeDurationFrom,
      "timeDurationTo": timeDurationTo,
      "doctorId": userid,
      "fullDay": "0",
      "clinicId": ClinicId
    };
    print("_queryParameters : " + _queryParameters.toString());
    try {
      final response = await WebApiProvider().getData(
          url: "chart/events/",
          isPost: true,
          token: TOKEN,
          queryParameters: _queryParameters,
          isQueryParmeter: true);

      if (response.statusCode == 200) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.pushNamed(context, RoutesName.DOCTOR_EVENT);
        });
      } else {
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
  }
}
