import 'package:ayur360_app/HomeScreen/lostPassword.dart';

import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';

class lostpassword {
  Future lostPassword() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print(
        "userservice/anonymous/checkMailAndUser?userId=${UserNameController.text}&email=${EmailController.text}");
    final response = await WebApiProvider().getData(
        url:
            "userservice/anonymous/checkMailAndUser?userId=${UserNameController.text}&email=${EmailController.text}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);

    print("data->>>>>>>>>${response}");
    if (response == true) {
      final response1 = await WebApiProvider().getData(
          url:
              "userservice/anonymous/shareResetPasswordLink?email=${EmailController.text}&userId=${UserNameController.text}&clinicId=1",
          isPost: false,
          token: TOKEN,
          queryParameters: _queryParameters,
          isQueryParmeter: false);
      print("data->>>>>>>>>${response1}");
      return response1;
    } else {
      print("processing");
    }

    return response;
  }
}
