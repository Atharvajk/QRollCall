class getClass {
  String? status;
  List<Data>? data;

  getClass({this.status, this.data});

  getClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  List<Timetable>? timetable;
  int? iV;

  Data({this.sId, this.name, this.timetable, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    if (json['timetable'] != null) {
      timetable = <Timetable>[];
      json['timetable'].forEach((v) {
        timetable!.add(new Timetable.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.timetable != null) {
      data['timetable'] = this.timetable!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Timetable {
  String? day;
  List<Schedule>? schedule;
  String? sId;

  Timetable({this.day, this.schedule, this.sId});

  Timetable.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add(new Schedule.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Schedule {
  String? subject;
  String? startTime;
  String? endTime;
  String? faculty;
  String? sId;

  Schedule(
      {this.subject, this.startTime, this.endTime, this.faculty, this.sId});

  Schedule.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    faculty = json['faculty'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['faculty'] = this.faculty;
    data['_id'] = this.sId;
    return data;
  }
}