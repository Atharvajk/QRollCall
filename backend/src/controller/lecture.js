const Lecture = require("../models/lecture");
const student = require("../models/student");
const { getClassStudents } = require("./classroom");

var globalWifiList=[]
var studentLeader=0
//When teacher starts the attendance QR first init session
const initAttendance = async (req, res, next) => {
  const { facultyId, subjectId, classroom} = req.body;
  //  console.log(classroom)
  const classroomStudents = await student.find({ classroom }); // get all students of particular classroom
  //  console.log("All students from class", allStuds)
  const lecture = new Lecture({
    // other fields of the Lecture schema
    facultyId:facultyId,
    subjectId:subjectId,
    classroom:classroom,
    allStudents: classroomStudents.map((student) => ({
      studentId: student._id,
      isPresent: false,
    }))
  });

  await lecture.save();
  res.status(201).json({ message: "Lecture initialized", lecture,lectureURL:`http://localhost:5000/api/v1/mark-attendance/${lecture._id}` });
};

const markStudentAttendace = async (req, res, next) => {
  var lectureId=req.params.id
  const { studentId } = req.body;
  try {
    const lecture = await Lecture.findById(lectureId);
    const student=lecture.allStudents.filter((val)=>{
        return val.studentId==studentId
    })
    var markStudentAsPresent;
    console.log(student)
    if(student[0].isPresent!==true){
     markStudentAsPresent=await Lecture.findOneAndUpdate(
      { _id: lectureId, 'allStudents._id': student[0]._id },
      {
        $set: {
          "allStudents.$.isPresent": "true",
        }
      },
     );
    res.json({message:"Student Successfully mark as present"});
    }else{
      markStudentAsPresent=await Lecture.findOneAndUpdate(
        { _id: lectureId, 'allStudents._id': student[0]._id },
        {
          $set: {
            "allStudents.$.isPresent": "false",
          }
        },
       );
      res.json({message:"Student Successfully mark as absent"});
    }
  } catch (err) {
    console.error(err);
    return res.status(500).json({ message: "Internal server error" });
  }
};
module.exports = {
  initAttendance,
  markStudentAttendace,
};
