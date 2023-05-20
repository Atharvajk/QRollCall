const express=require('express')
const {initAttendance, markStudentAttendace}=require('../controller/lecture')
const router=express.Router();

router.post("/init-lecture",initAttendance)
router.put("/mark-attendance/:id", markStudentAttendace)
module.exports=router