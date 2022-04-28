import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';

class ChangePasswordRepository {
  Future changePassword(String password) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print(
        "api/userMaster/checkPassword?userPassword=123&userName=${DoctorName}");
    final response = await WebApiProvider().getData(
        url:
            "api/userMaster/checkPassword?userPassword=${password}&userName=${DoctorName}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("data->>>>>>>>>${response}");
    return response;
  }
}
