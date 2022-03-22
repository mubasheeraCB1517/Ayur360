import 'package:ayur360_app/Doctor/bottomsheet.dart';

import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../models/doctorEventModel.dart';

class LeaveReportRepository {
  Future<List> getLeaveeport() async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>{

        "eventsId": "0",
        "eventsName": reasonController.text,
        "eventsDate": leavedateController.text,
        "timeDurationFrom": durationfromController.text,
        "timeDurationTo":durationtoController.text,
        "doctorId": userid,
        "fullDay": "0",
        "clinicId": 1

    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "chart/events/",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("responseleace->>>>>>>>${response}");
    return response;
  }
}
