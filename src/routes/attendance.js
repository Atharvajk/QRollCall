const express=require('express')
const { 
    getClassAttendance,
    getStudentAttendance,
    totalLectureOfSubject
}=require('../controller/attendance')

const router=express.Router()
router.post("/get-class-attendance",getClassAttendance)
router.post("/get-student-attendance",getStudentAttendance)
router.post("/get-lecture-details",totalLectureOfSubject)

module.exports=router