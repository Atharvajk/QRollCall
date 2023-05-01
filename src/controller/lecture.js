const Lecture = require("../models/lecture");
const student = require("../models/student");
const { getClassStudents } = require("./classroom");

//When teacher starts the attendance QR first init session
const initAttendance = async (req, res, next) => {
  const { facultyId, subjectId, classroom, studentId } = req.body;
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
    // Find the student subdocument with the given studentId
    const student = lecture.allStudents.find(
      (s) => s.studentId.toString() === studentId
    );
    // Toggle the isPresent field using the $ne operator
    // const updatedLecture = await Lecture.findOneAndUpdate(
    //   { _id: lectureId, "allStudents.studentId": studentId },
    //   { $set: { "allStudents.$.isPresent": { $ne: student.isPresent } } },
    //   { new: true }
    // );
    const updatedLecture = await Lecture.findById(lectureId)
    const data=updatedLecture.allStudents.filter((val)=>{
        return val.studentId==studentId
    })
    console.log(data)
    res.json(updatedLecture);
  } catch (err) {
    console.error(err);
    return res.status(500).json({ message: "Internal server error" });
  }
};
module.exports = {
  initAttendance,
  markStudentAttendace,
};
