import 'package:ayur360_app/Doctor/UserSetting/DoctorEventScreen.dart';
import 'package:ayur360_app/Doctor/models/leaveReportEditingModel.dart';
import 'package:ayur360_app/Doctor/models/myPracticeTimeModel.dart';
import 'package:ayur360_app/Doctor/models/myProfileModel.dart';

import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../models/doctorEventModel.dart';

class LeaveReportDeleteRepository {
  Future getLeaveReportdelete(int ids) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("chart/events/${ids}");
    final response = await WebApiProvider().getData(
        url: "chart/events/delete/${ids}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("data->>>>>>>>>${response}");
    return response;
  }
}
