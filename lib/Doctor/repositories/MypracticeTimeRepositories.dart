import 'package:ayur360_app/Doctor/models/myPracticeTimeModel.dart';
import 'package:ayur360_app/Doctor/models/myProfileModel.dart';

import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../models/doctorEventModel.dart';

class MyPracticeTimeRepository {
  Future<MypracticeTimeModel> getMyPracticeTime() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};

    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "userservice/doctorvisitingtime/${userid}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("responseertyui->>>>>>>>>${response}");
    return MypracticeTimeModel.fromJson(response);
  }
}
