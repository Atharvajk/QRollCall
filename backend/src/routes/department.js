const express=require('express')
const {getDeptDetails,saveDeptDetails}=require('../controller/department')

const router=express.Router();

router.get("/getdeptdetails",getDeptDetails)
router.post("/savedeptdetails",saveDeptDetails)

module.exports=router