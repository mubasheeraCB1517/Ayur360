class LeavereportEditModel {
  int? clinicId;
  int? doctorId;
  Object? doctorName;
  String? eventsDate;
  int? eventsId;
  String? eventsName;
  String? fullDay;
  Object? pageNo;
  Object? rowCount;
  String? timeDurationFrom;
  String? timeDurationTo;
  Object? totalCount;
  Object? userId;

  LeavereportEditModel(
      {this.clinicId,
      this.doctorId,
      this.doctorName,
      this.eventsDate,
      this.eventsId,
      this.eventsName,
      this.fullDay,
      this.pageNo,
      this.rowCount,
      this.timeDurationFrom,
      this.timeDurationTo,
      this.totalCount,
      this.userId});

  factory LeavereportEditModel.fromJson(Map<String, dynamic> json) {
    return LeavereportEditModel(
      clinicId: json['clinicId'],
      doctorId: json['doctorId'],
      eventsDate: json['eventsDate'],
      eventsId: json['eventsId'],
      eventsName: json['eventsName'],
      fullDay: json['fullDay'],
      timeDurationFrom: json['timeDurationFrom'],
      timeDurationTo: json['timeDurationTo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicId'] = this.clinicId;
    data['doctorId'] = this.doctorId;
    data['eventsDate'] = this.eventsDate;
    data['eventsId'] = this.eventsId;
    data['eventsName'] = this.eventsName;
    data['fullDay'] = this.fullDay;
    data['timeDurationFrom'] = this.timeDurationFrom;
    data['timeDurationTo'] = this.timeDurationTo;
    return data;
  }
}
