import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/HomeScreen/doctorLoginScreen.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

var TOKEN;

var userid;

var DoctorName;

class drLOginRepository {
  var dio = Dio();


  Future createUser(String username, String password, context) async {
    print("sdfgh");
    var formData = {
      "grant_type": "password",
      "client_id": "client-app",
      "client_secret": "123456",
      "username": "${username}~CU",
      "password": password
    };
    print("formdata->>>>>>${formData}");
    try {
      Dio _dio = new Dio();
      _dio.options.contentType = Headers.formUrlEncodedContentType;

      final responseData = await _dio.post<Map<String, dynamic>>(
          '${baseUrl}auth/oauth/token',
          data: formData);
      var token = responseData.data;
      var token1 = token?["data"];
      TOKEN = token1["token"];
      print("token1->>>>>${TOKEN}");
      print("Response->>>>>${responseData.toString()}");

      if (responseData.statusCode == 200) {
        final response = await _dio.get<Map<String, dynamic>>(
            '${baseUrl}api/user/currentUser',
            options: Options(
              headers: <String, dynamic>{
                'authorization': 'Bearer ${TOKEN}',
              },
            ));
        var role = response.data;
        var userId = response.data;
        var doctorname = response.data;
        userid = userId?["id"];
        DoctorName = doctorname?["userId"];
        var role1 = role?["roles"];
        print("role1->>>>>${DoctorName}");
        print("Bearer--->>>>>>>Bearer ${TOKEN}");

        if (response.statusCode == 200) {
          //print("api->>>>>>>${baseUrl}userservice/userMenu/listWithRole/${role1[0]}/ayur360.in}");
          // final response1 = await _dio.get<List<dynamic>>(
          //     '${baseUrl}userservice/userMenu/listWithRole/${role1[0]}/ayur360.in',
          //     options: Options(
          //       headers: <String, dynamic>{
          //         'authorization':'Bearer ${TOKEN}',
          //       },
          //     ));
          // print("response1->>>>>${response1}");
        }
      }
      if (responseData.statusCode == 200) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.pushNamed(context, RoutesName.DASHBOARD_PAGE);
        });

        return responseData;
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: "Username or password is not registerd",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}
