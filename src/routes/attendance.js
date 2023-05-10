const express=require('express')
const { 
    getClassAttendance,
    totalLectureOfSubject
}=require('../controller/attendance')

const router=express.Router()

router.post("/get-class-attendance",getClassAttendance)
router.post("/get-lecture-details",totalLectureOfSubject)

module.exports=router