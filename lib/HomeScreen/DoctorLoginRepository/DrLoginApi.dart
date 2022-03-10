

import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/HomeScreen/doctorLoginScreen.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class drLOginRepository {

  var dio = Dio();
  var token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGluaWNJZCI6MSwidXNlcl9uYW1lIjoiYW5zYXIiLCJzY29wZSI6WyJhbGwiXSwiaWQiOjEzLCJ1c2VyVHlwZSI6IkRPQ1RPUiIsImV4cCI6MTY0NjI5NjkzNCwiYXV0aG9yaXRpZXMiOlsiRE9DVE9SIl0sImp0aSI6IjkwNWMwNGI5LWVjZmMtNDEyOC04N2IxLWFmODQ1MjczYWM3NyIsImNsaWVudF9pZCI6ImNsaWVudC1hcHAifQ.JIdkw2bRJJIhJ7ZyViBLM-26vDAy6iUIwNePAqQZt33_xWMZ-9bZOWYt_S-AP37rn7c3l1e5bfEN2ZlMKX2h4PAzRT23Z-8-y_IW2TDKJpS64TOrrfQAf8B4xzinQEk3507-Z35Gwxl7ouHV-P7pXwPmiFA_AoAVadSs4nSfkDQ";

  Future createUser(String username, String password,context) async {
    print("sdfgh");
    var formData = {
      "grant_type": "password",
      "client_id": "client-app",
      "client_secret": "123456",
      "username": "${username}~CU",
      "password": password
    };
    try {
      Dio _dio = new Dio();
      _dio.options.contentType = Headers.formUrlEncodedContentType;

      final responseData = await _dio.post<Map<String, dynamic>>(
          '${baseUrl}auth/oauth/token',

          data: formData);
    var token = responseData.data;
    var token1 = token?["data"];
    var TOKEN = token1["token"];
      print("token1->>>>>${TOKEN}");
      print("Response->>>>>${responseData.toString()}");

      if (responseData.statusCode == 200) {
        final response = await _dio.get<Map<String, dynamic>>(
            '${baseUrl}api/user/currentUser',
            options: Options(


              headers: <String, dynamic>{
                'authorization':'Bearer ${TOKEN}',


              },


            ));
        var role = response.data;
        print("role->>>>>${role}");
        var role1 = role?["roles"];
        print("role1->>>>>${role1}");
        print("Bearer--->>>>>>>Bearer ${TOKEN}");
        print("Response->>>>>${response}");
        print("Response->>>>>${response}");
        print("Response->>>>>${response}");

        if(response.statusCode ==200){
          final response1 = await _dio.get<List<dynamic>>(
              '${baseUrl}userservice/userMenu/listWithRole/${role1[0]}/ayur360.in',
              options: Options(


                headers: <String, dynamic>{
                  'authorization':'Bearer ${TOKEN}',


                },


              ));
          print("response1->>>>>${response1}");
        }
        

      }

      if (responseData.statusCode ==200) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.pushNamed(context, RoutesName.DASHBOARD_PAGE );
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