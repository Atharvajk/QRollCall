class get_student_attendance {
  String? name;
  List<StudentAttendanceArray>? studentAttendanceArray;

  get_student_attendance({this.name, this.studentAttendanceArray});

  get_student_attendance.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['studentAttendanceArray'] != null) {
      studentAttendanceArray = <StudentAttendanceArray>[];
      json['studentAttendanceArray'].forEach((v) {
        studentAttendanceArray!.add(new StudentAttendanceArray.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.studentAttendanceArray != null) {
      data['studentAttendanceArray'] =
          this.studentAttendanceArray!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentAttendanceArray {
  String? subjectName;
  String? subjectId;
  List<LectureDetail>? lectureDetail;
  int? totalLectureOfsubject;
  int? studentAttendedLecture;
  int? totalPercentageAttendance;

  StudentAttendanceArray(
      {this.subjectName,
      this.subjectId,
      this.lectureDetail,
      this.totalLectureOfsubject,
      this.studentAttendedLecture,
      this.totalPercentageAttendance});

  StudentAttendanceArray.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    subjectId = json['subjectId'];
    if (json['lectureDetail'] != null) {
      lectureDetail = <LectureDetail>[];
      json['lectureDetail'].forEach((v) {
        lectureDetail!.add(new LectureDetail.fromJson(v));
      });
    }
    totalLectureOfsubject = json['totalLectureOfsubject'];
    studentAttendedLecture = json['studentAttendedLecture'];
    totalPercentageAttendance = json['totalPercentageAttendance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectName'] = this.subjectName;
    data['subjectId'] = this.subjectId;
    if (this.lectureDetail != null) {
      data['lectureDetail'] =
          this.lectureDetail!.map((v) => v.toJson()).toList();
    }
    data['totalLectureOfsubject'] = this.totalLectureOfsubject;
    data['studentAttendedLecture'] = this.studentAttendedLecture;
    data['totalPercentageAttendance'] = this.totalPercentageAttendance;
    return data;
  }
}

class LectureDetail {
  String? sId;
  String? facultyId;
  String? subjectId;
  String? classroom;
  String? date;
  int? iV;
  List<Student>? student;

  LectureDetail(
      {this.sId,
      this.facultyId,
      this.subjectId,
      this.classroom,
      this.date,
      this.iV,
      this.student});

  LectureDetail.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    facultyId = json['facultyId'];
    subjectId = json['subjectId'];
    classroom = json['classroom'];
    date = json['date'];
    iV = json['__v'];
    if (json['student'] != null) {
      student = <Student>[];
      json['student'].forEach((v) {
        student!.add(new Student.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['facultyId'] = this.facultyId;
    data['subjectId'] = this.subjectId;
    data['classroom'] = this.classroom;
    data['date'] = this.date;
    data['__v'] = this.iV;
    if (this.student != null) {
      data['student'] = this.student!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Student {
  String? studentId;
  bool? isPresent;
  String? sId;

  Student({this.studentId, this.isPresent, this.sId});

  Student.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    isPresent = json['isPresent'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['isPresent'] = this.isPresent;
    data['_id'] = this.sId;
    return data;
  }
}
