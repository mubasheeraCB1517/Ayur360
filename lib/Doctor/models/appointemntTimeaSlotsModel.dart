class AppointmentTimeZoneModel {
  String? clientSlotes;
  Object? fromtime;
  String? selected;
  Object? slotdur;
  String? slotes;
  Object? totime;

  AppointmentTimeZoneModel(
      {this.clientSlotes,
      this.fromtime,
      this.selected,
      this.slotdur,
      this.slotes,
      this.totime});

  factory AppointmentTimeZoneModel.fromJson(Map<String, dynamic> json) {
    return AppointmentTimeZoneModel(
        clientSlotes: json['clientSlotes'], slotes: json['slotes']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientSlotes'] = this.clientSlotes;
    data['selected'] = this.selected;
    data['slotes'] = this.slotes;

    return data;
  }
}
