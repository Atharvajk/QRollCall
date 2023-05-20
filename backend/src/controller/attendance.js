const Classroom = require("../models/classroom");
const Student = require("../models/student");
const Semister = require("../models/semister");
const Lecture = require("../models/lecture");
const Subject = require("../models/subject");

const getClassAttendance = async (req, res, next) => {
  var { classroomId } = req.body;
  try {
    var students = await Student.find({classroom:classroomId});
    var semSubjects = await Semister.find({ _id: students[0].semister }).populate({
      path: "subjects",
    });
    var StudentSubjectArray=[],
    studentAttendanceArray = [];
    console.log(semSubjects[0].subjects);
  for(var index=0;index<students.length;index++){
    StudentSubjectArray=[]
    for (var i = 0; i < semSubjects[0].subjects.length; i++) {
      var  lectureDetail= await Lecture.aggregate([
          {
            $match: {
              $expr: {
                $eq: ["$classroom", { $toObjectId: classroomId }],
                $eq: [
                  "$subjectId",
                  { $toObjectId: semSubjects[0].subjects[i]._id },
                ],
              },
            },
          },
          {
            $set: {
              student: {
                $filter: {
                  input: "$allStudents",
                  as: "item",
                  cond: {
                    $and: [
                      { $eq: ["$$item.studentId", { $toObjectId: students[index]._id }] },
                      { $eq: ["$$item.isPresent", true] }
                    ],
                  },
                },
              },
            },
          },
          {
            $project: {
              allStudents: 0
            },
          },
        ])
      var totalSumOfLecture = 0;
      var totalLectureConducted = lectureDetail.length;
      for (var j = 0; j < lectureDetail.length; j++) {
        totalSumOfLecture += lectureDetail[j].student.length;
      }
      StudentSubjectArray.push({
        // ...StudentObject,
        subjectName: semSubjects[0].subjects[i].subject,
        subjectId: semSubjects[0].subjects[i]._id,
        totalLectureOfsubject: totalLectureConducted,
        studentAttendedLecture: totalSumOfLecture,
        totalPercentageAttendance:
          totalLectureConducted == 0
            ? 0
            : (totalSumOfLecture / totalLectureConducted) * 100,
      });
    }
    studentAttendanceArray.push({  
      studentName:students[index].name,
      studentRollNo:students[index].rollNo,
      studentLectureDetails:StudentSubjectArray
    });
  }
    res.json(studentAttendanceArray);
  } catch (err) {
    next(err);
  }
};

const getStudentAttendance = async (req, res, next) => {
  var { classroomId, studentId } = req.body;
  try {
    var student = await Student.findById(studentId);
    var semSubjects = await Semister.find({ _id: student.semister }).populate({
      path: "subjects",
    });
    var StudentObject,
      studentAttendanceArray = [];
    console.log(semSubjects[0].subjects);
    for (var i = 0; i < semSubjects[0].subjects.length; i++) {
      StudentObject = {
        subjectName: semSubjects[0].subjects[i].subject,
        subjectId: semSubjects[0].subjects[i]._id,
        lectureDetail: await Lecture.aggregate([
          {
            $match: {
              $expr: {
                $eq: ["$classroom", { $toObjectId: classroomId }],
                $eq: [
                  "$subjectId",
                  { $toObjectId: semSubjects[0].subjects[i]._id },
                ],
              },
            },
          },
          {
            $set: {
              student: {
                $filter: {
                  input: "$allStudents",
                  as: "item",
                  cond: {
                    $and: [
                      { $eq: ["$$item.studentId", { $toObjectId: studentId }] }
                    ],
                  },
                },
              },
            },
          },
          {
            $project: {
              allStudents: 0, // Exclude specific fields,
            },
          },
        ]),
      };
      var totalSumOfLecture = 0;
      var totalLectureConducted = StudentObject.lectureDetail.length;
      for (var j = 0; j < StudentObject.lectureDetail.length; j++) {
        for(var index=0;index<StudentObject.lectureDetail[j].student.length;index++ ){
           var count= StudentObject.lectureDetail[j].student[index].isPresent==true?1:0;
           totalSumOfLecture +=count;
        }
      }
      StudentObject = {
        ...StudentObject,
        totalLectureOfsubject: totalLectureConducted,
        studentAttendedLecture: totalSumOfLecture,
        totalPercentageAttendance:
          totalLectureConducted == 0
            ? 0
            : (totalSumOfLecture / totalLectureConducted) * 100,
      };
      studentAttendanceArray.push(StudentObject);
    }
    res.json({ name: student.name, studentAttendanceArray });
  } catch (err) {
    next(err);
  }
};

const totalLectureOfSubject = async (req, res, next) => {
  var { classroomId, subjectId } = req.body;
  try {
    var allLectureOfSubject = [];
    allLectureOfSubject = await Lecture.find({
      classroom: classroomId,
      subjectId: subjectId,
    });
  } catch (err) {
    next(err);
  }

  if (!allLectureOfSubject)
    return res.status(500).json({ message: "Internal server error" });

  return res.status(200).json({
    msg: "Success",
    allLectureOfSubject,
    toatlLecCount: allLectureOfSubject.length,
  });
};
module.exports = {
  getClassAttendance,
  getStudentAttendance,
  totalLectureOfSubject,
};
