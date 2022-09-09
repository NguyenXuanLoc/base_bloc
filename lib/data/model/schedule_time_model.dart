// To parse this JSON data, do
//
//     final scheduleTime = scheduleTimeFromJson(jsonString);

import 'dart:convert';

ScheduleTime scheduleTimeFromJson(dynamic str) => ScheduleTime.fromJson(str);

String scheduleTimeToJson(ScheduleTime data) => json.encode(data.toJson());

class ScheduleTime {
  ScheduleTime({
    this.haveSchedule,
    this.scheduleId,
    this.scheduleDateTime,
    this.period,
    this.periodIndex,
  });

  bool? haveSchedule;
  int? scheduleId;
  String? scheduleDateTime;
  int? period;
  int? periodIndex;

  factory ScheduleTime.fromJson(Map<String, dynamic> json) => ScheduleTime(
    haveSchedule: json["have_schedule"],
    scheduleId: json["schedule_id"],
    scheduleDateTime: json["schedule_date_time"],
    period: json["period"],
    periodIndex: json["period_index"],
  );

  Map<String, dynamic> toJson() => {
    "have_schedule": haveSchedule,
    "schedule_id": scheduleId,
    "schedule_date_time": scheduleDateTime,
    "period": period,
    "period_index": periodIndex,
  };
}
