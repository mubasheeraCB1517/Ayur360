import 'dart:async';
import 'package:ayur360_app/Doctor/models/myPracticeTimeModel.dart';
import 'package:ayur360_app/Doctor/repositories/MypracticeTimeRepositories.dart';
import 'package:ayur360_app/Updater/network/response.dart';

class MyPracticeTimeBloc {
  MyPracticeTimeRepository _mypracticetimeRepository =
      new MyPracticeTimeRepository();
  final _mypracticetimeListDataCntroller =
      StreamController<Response<MypracticeTimeModel>>();

  StreamSink<Response<MypracticeTimeModel>> get mypracticeTimeDataSink =>
      _mypracticetimeListDataCntroller.sink;

  Stream<Response<MypracticeTimeModel>> get mypracticeTimeDataStream =>
      _mypracticetimeListDataCntroller.stream;

  MyPracticeTimeBloc() {
    _mypracticetimeRepository = MyPracticeTimeRepository();
    getmypracticeList();
    print("fsfds");
  }

  getmypracticeList() async {
    mypracticeTimeDataSink.add(Response.loading('Fetching...'));
    try {
      MypracticeTimeModel _mypracticetimeList =
          await _mypracticetimeRepository.getMyPracticeTime();
      mypracticeTimeDataSink.add(Response.success(_mypracticetimeList));
    } catch (e) {
      mypracticeTimeDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _mypracticetimeListDataCntroller.close();
  }
}
