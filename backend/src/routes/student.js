const express=require('express')
const{
    getStudDetails,
    saveStudDetails,
    updateStudDetails,
    findStudent,
    studentlogin,
    deleteStudent
}=require('../controller/student')
const router=express.Router();

router.get("/getstuddetails", getStudDetails)
router.get("/findstudent/:id",findStudent)
router.post("/savestuddetails",saveStudDetails)
router.post("/studentlogin",studentlogin)
router.put("/updatestuddetails/:id",updateStudDetails)
router.delete("/deletestudent/:id",deleteStudent)
module.exports=router