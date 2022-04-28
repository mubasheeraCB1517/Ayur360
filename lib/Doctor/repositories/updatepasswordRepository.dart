import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';

class UpdatePasswordRepository {
  Future updatePassword(String password0) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "password": "${password0}",
      "userId": DoctorName
    };
    print("a_queryParameters-<>>>>>>>>.${_queryParameters}");
    final response = await WebApiProvider().getData(
        url: "api/userMaster/updatePassword",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("data->>>>>>>>>${response}");
    return response;
  }
}
