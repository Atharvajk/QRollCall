const Classroom = require("../models/classroom");
const Student = require("../models/student");
const Semister = require("../models/semister");
const Lecture = require("../models/lecture");
const Subject = require("../models/subject");
const getClassAttendance = async (req, res, next) => {
  var { classroomId } = req.body;
  try {
    var allStud=await Student.find({classroom:classroomId})
    console.log(allStud)
    var semSubjects=await Semister.find({_id:allStud[0].semister})
    console.log(semSubjects[0].subjects)
    var allStudArray=[]
    var subArray=[]
  //  var data=Lecture.find({classroom:classroomId,'allStudents.$.studentId':'{ $toObjectId: 644dd150c462999e055320ec }'})
    for(var i=0;i<allStud.length;i++){
      var data;
      subArray=[]
    for(var j=0;j<semSubjects[0].subjects.length;j++){
     data=await Lecture.aggregate([
    { $match: { $expr : 
        { 
          $eq: [ 
            '$classroom' ,
             { $toObjectId: classroomId }
             ] ,
          $eq: [ 
            '$subjectId' ,
             { $toObjectId: semSubjects[0].subjects[j] }  
             ] 
       } 
      }
    },
    filter = {
      '$set': {
        student: {
          '$filter': {
            input: '$allStudents',
            as: 'item',
            cond: { '$eq': [ '$$item.studentId',{ $toObjectId: allStud[i]._id }   ] }
          }
        }
      }
    }
    ])
    subArray.push({
      subName:semSubjects[0].subjects[j],
      data
    })
  }
  allStudArray.push(
    {
      name:allStud[i].name,
      subArray
    }
  )
}
    res.json(allStudArray)

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

  return res
    .status(200)
    .json({
      msg: "Success",
      allLectureOfSubject,
      toatlLecCount: allLectureOfSubject.length,
    });
};
module.exports = {
  getClassAttendance,
  totalLectureOfSubject,
};
