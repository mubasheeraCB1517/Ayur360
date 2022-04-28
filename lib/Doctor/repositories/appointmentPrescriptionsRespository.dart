import 'package:ayur360_app/Doctor/models/appointementPrescriptionModel.dart';
import 'package:ayur360_app/Doctor/models/appointmentLabTestModel.dart';
import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';

class AppointmentPrescriptionDetailsRepository {
  Future getAppointmentprescriptionsEditDetails() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("masters/labTest/search?term=&id=1");
    final response = await WebApiProvider().getData(
        url: "shoppingcart/product/list?term=",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>>>>>>>${response}");
    return (response as List)
        .map((x) => AppointmentPrescriptionModel.fromJson(x))
        .toList();
  }
}
