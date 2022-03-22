class doctorEventmodel {
    int? clinicId;
    int? doctorId;
    String? doctorName;
    String? eventsDate;
    int? eventsId;
    String? eventsName;
    String? fullDay;
    int? pageNo;
    Object? rowCount;
    String? timeDurationFrom;
    String? timeDurationTo;
    int? totalCount;
    Object? userId;
    int? slno;

    doctorEventmodel({this.clinicId, this.doctorId, this.doctorName, this.eventsDate, this.eventsId, this.eventsName, this.fullDay, this.pageNo, this.rowCount, this.timeDurationFrom, this.timeDurationTo, this.totalCount, this.userId});

    factory doctorEventmodel.fromJson(Map<String, dynamic> json) {
        return doctorEventmodel(
            clinicId: json['clinicId'],
            doctorId: json['doctorId'],
            doctorName: json['doctorName'],
            eventsDate: json['eventsDate'],
            eventsId: json['eventsId'],
            eventsName: json['eventsName'],
            fullDay: json['fullDay'],
            pageNo: json['pageNo'],

            timeDurationFrom: json['timeDurationFrom'],
            timeDurationTo: json['timeDurationTo'],
            totalCount: json['totalCount'],

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['clinicId'] = this.clinicId;
        data['doctorId'] = this.doctorId;
        data['doctorName'] = this.doctorName;
        data['eventsDate'] = this.eventsDate;
        data['eventsId'] = this.eventsId;
        data['eventsName'] = this.eventsName;
        data['fullDay'] = this.fullDay;
        data['pageNo'] = this.pageNo;
        data['timeDurationFrom'] = this.timeDurationFrom;
        data['timeDurationTo'] = this.timeDurationTo;
        data['totalCount'] = this.totalCount;

        return data;
    }
}