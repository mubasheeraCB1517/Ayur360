import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../models/doctorEventModel.dart';

class DoctorEventRepository {
  Future<List<doctorEventmodel>> getDoctoreventList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "clinicId": 1,
      "eventsName": "",
      "pageNo": "",
      "rowCount": 10,
      "userId": userid
    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "chart/events/list",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return (response as List).map((x) => doctorEventmodel.fromJson(x)).toList();
  }
}
