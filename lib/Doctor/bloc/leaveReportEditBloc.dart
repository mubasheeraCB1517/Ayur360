import 'dart:async';
import 'package:ayur360_app/Doctor/models/leaveReportEditingModel.dart';
import 'package:ayur360_app/Doctor/repositories/leaveReportEditingRepositories.dart';
import 'package:ayur360_app/Updater/network/response.dart';


class LeaveReportEditBloc {
  LeaveReportEditRepository _leaveReportEditRepository =
      new LeaveReportEditRepository();
  final _leaveReportEditListDataCntroller =
      StreamController<Response<LeavereportEditModel>>();

  StreamSink<Response<LeavereportEditModel>> get leaveReportEditDataSink =>
      _leaveReportEditListDataCntroller.sink;

  Stream<Response<LeavereportEditModel>> get leaveReportEditDataStream =>
      _leaveReportEditListDataCntroller.stream;

  LeaveReportEditBloc(int id) {
    _leaveReportEditRepository = LeaveReportEditRepository();
    getleaveReportEditList(id);
    print("fsfds");
  }

  getleaveReportEditList(int id) async {
    leaveReportEditDataSink.add(Response.loading('Fetching...'));
    try {
      LeavereportEditModel _getleaveReportEditList =
          await _leaveReportEditRepository.getLeaveReportEdit(id);
      leaveReportEditDataSink.add(Response.success(_getleaveReportEditList));
    } catch (e) {
      leaveReportEditDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _leaveReportEditListDataCntroller.close();
  }
}
