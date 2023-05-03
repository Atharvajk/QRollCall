const Lecture = require("../models/lecture");
const student = require("../models/student");
const { getClassStudents } = require("./classroom");

//When teacher starts the attendance QR first init session
const initAttendance = async (req, res, next) => {
  const { facultyId, subjectId, classroom} = req.body;
  //  console.log(classroom)
  const classroomStudents = await student.find({ classroom }); // get all students of particular classroom
  //  console.log("All students from class", allStuds)
  const lecture = new Lecture({
    // other fields of the Lecture schema
    allStudents: classroomStudents.map((student) => ({
      studentId: student._id,
      isPresent: false,
    })),
  });

  await lecture.save();
  res.status(201).json({ message: "Lecture initialized", lecture });
};

const markStudentAttendace = async (req, res, next) => {
  const { studentId, lectureId } = req.body;
  try {
    const lecture = await Lecture.findById(lectureId);
    const student=lecture.allStudents.filter((val)=>{
        return val.studentId==studentId
    })
    var markStudentAsPresent;
     markStudentAsPresent=await Lecture.findOneAndUpdate(
      { _id: lectureId, 'allStudents._id': student[0]._id },
      {
        $set: {
          "allStudents.$.isPresent": "true",
        }
      },
     );
    res.json({message:"Student Successfully mark as present"});
  } catch (err) {
    console.error(err);
    return res.status(500).json({ message: "Internal server error" });
  }
};
module.exports = {
  initAttendance,
  markStudentAttendace,
};
