const express=require('express')
const {
    getSubjectDetails,
    saveSubjectDetails
}=require('../controller/subject')
const router=express.Router();

router.get("/getsubjectdetails",getSubjectDetails)
router.post("/savesubjectdetails",saveSubjectDetails)

module.exports=router