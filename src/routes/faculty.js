const express=require('express')
const {getFacultyDetails,saveFacultyDetails,facultylogin,setTimeTable,getfacultydetail,getTodaysTimetable,deleteFaculty}=require('../controller/faculty')

const router=express.Router();

router.get("/getfacultydetails",getFacultyDetails)
router.get("/gettodaystimetable/:id",getTodaysTimetable)
router.get("/get-faculty-detail/:id",getfacultydetail)
router.post("/savefacultydetails",saveFacultyDetails)
router.post("/facultylogin",facultylogin)
router.put("/setfacultytimetable/:id",setTimeTable)
router.delete("/deletefaculty/:id",deleteFaculty)
module.exports=router