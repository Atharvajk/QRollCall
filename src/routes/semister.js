
const express=require('express')
const {
    getSemDetails,
    saveSemDetails
}=require('../controller/semister')
const router=express.Router();

router.get("/getsemdetails",getSemDetails)
router.post("/savesemdetails",saveSemDetails)

module.exports=router