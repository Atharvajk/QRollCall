const express=require('express')
const {getInstitueDetails,saveInstituteDetails,institutelogin}=require('../controller/institute')
const router=express.Router();

router.get("/getinstitutedetails",getInstitueDetails)
router.post("/saveinstitutedetails",saveInstituteDetails)
router.post("/institutelogin",institutelogin)
module.exports=router