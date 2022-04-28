class MypracticeTimeModel {
  int? clinicId;
  int? doctorId;
  int? doctorVisitingTimeId;
  String? friTimeFrom;
  String? friTimeTo;
  String? monTimeFrom;
  String? monTimeTo;
  String? satTimeFrom;
  String? satTimeTo;
  String? sunTimeFrom;
  String? sunTimeTo;
  String? thursTimeFrom;
  String? thursTimeTo;
  String? tuesTimeFrom;
  String? tuesTimeTo;
  String? wedTimeFrom;
  String? wedTimeTo;

  MypracticeTimeModel(
      {this.clinicId,
      this.doctorId,
      this.doctorVisitingTimeId,
      this.friTimeFrom,
      this.friTimeTo,
      this.monTimeFrom,
      this.monTimeTo,
      this.satTimeFrom,
      this.satTimeTo,
      this.sunTimeFrom,
      this.sunTimeTo,
      this.thursTimeFrom,
      this.thursTimeTo,
      this.tuesTimeFrom,
      this.tuesTimeTo,
      this.wedTimeFrom,
      this.wedTimeTo});

  factory MypracticeTimeModel.fromJson(Map<String, dynamic> json) {
    return MypracticeTimeModel(
      clinicId: json['clinicId'],
      doctorId: json['doctorId'],
      doctorVisitingTimeId: json['doctorVisitingTimeId'],
      friTimeFrom: json['friTimeFrom'],
      friTimeTo: json['friTimeTo'],
      monTimeFrom: json['monTimeFrom'],
      monTimeTo: json['monTimeTo'],
      satTimeFrom: json['satTimeFrom'],
      satTimeTo: json['satTimeTo'],
      sunTimeFrom: json['sunTimeFrom'],
      sunTimeTo: json['sunTimeTo'],
      thursTimeFrom: json['thursTimeFrom'],
      thursTimeTo: json['thursTimeTo'],
      tuesTimeFrom: json['tuesTimeFrom'],
      tuesTimeTo: json['tuesTimeTo'],
      wedTimeFrom: json['wedTimeFrom'],
      wedTimeTo: json['wedTimeTo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicId'] = this.clinicId;
    data['doctorId'] = this.doctorId;
    data['doctorVisitingTimeId'] = this.doctorVisitingTimeId;
    data['friTimeFrom'] = this.friTimeFrom;
    data['friTimeTo'] = this.friTimeTo;
    data['monTimeFrom'] = this.monTimeFrom;
    data['monTimeTo'] = this.monTimeTo;
    data['satTimeFrom'] = this.satTimeFrom;
    data['satTimeTo'] = this.satTimeTo;
    data['sunTimeFrom'] = this.sunTimeFrom;
    data['sunTimeTo'] = this.sunTimeTo;
    data['thursTimeFrom'] = this.thursTimeFrom;
    data['thursTimeTo'] = this.thursTimeTo;
    data['tuesTimeFrom'] = this.tuesTimeFrom;
    data['tuesTimeTo'] = this.tuesTimeTo;
    data['wedTimeFrom'] = this.wedTimeFrom;
    data['wedTimeTo'] = this.wedTimeTo;
    return data;
  }
}
