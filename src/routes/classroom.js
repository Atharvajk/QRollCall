const express=require('express')
const { 
    getClassroomDetails,
    saveClassroomDetails,
    deleteClassroom,
    updateClassroom,
    getTodaysSchedule,
    getClassStudents
}=require('../controller/classroom')

const router=express.Router();

router.get("/getclassroomdetails",getClassroomDetails)
router.get("/getclassstudents/:id",getClassStudents)
router.post("/saveclassroomdetails",saveClassroomDetails)
router.delete("/deleteclassroom",deleteClassroom)
router.put("/updateclassroom/:id",updateClassroom)
router.post("/getclassschedule/:id",getTodaysSchedule)
module.exports=router