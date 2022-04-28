import 'dart:async';
import 'package:ayur360_app/Doctor/models/myProfileModel.dart';
import 'package:ayur360_app/Doctor/repositories/myProfileRepositories.dart';
import 'package:ayur360_app/Updater/network/response.dart';

class MyProfileListBloc {
  MyProfileRepository _myprofileListRepository = new MyProfileRepository();
  final _myprofileListDataController =
      StreamController<Response<MyprofileModel>>();

  StreamSink<Response<MyprofileModel>> get myprofileDataSink =>
      _myprofileListDataController.sink;

  Stream<Response<MyprofileModel>> get myprofileDataStream =>
      _myprofileListDataController.stream;

  MyProfileListBloc() {
    _myprofileListRepository = MyProfileRepository();
    getmyprofileList();
    print("fsfds");
  }

  getmyprofileList() async {
    myprofileDataSink.add(Response.loading('Fetching...'));
    try {
      MyprofileModel _myprofileList =
          await _myprofileListRepository.getMyprofileList();
      myprofileDataSink.add(Response.success(_myprofileList));
    } catch (e) {
      myprofileDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _myprofileListDataController.close();
  }
}
