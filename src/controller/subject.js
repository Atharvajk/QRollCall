const Subject=require('../models/subject')

const getSubjectDetails=async (req,res,next)=>{
   var data;
   try{
    data=await Subject.find()
   }catch(err){
    next(err)
   }
   if(!data){
    return res.status(500).json({message:"Internal server error"})
   }
   return res.status(200).json({status:"Success",data})
}

const saveSubjectDetails=async (req,res,next)=>{
    const {subCode,subject}=req.body;
    var data
    try{
     data=new Subject({
        subCode,subject
     })
     data=data.save();
    }catch(err){
     next(err)
    }
    if(!data){
     return res.status(500).json({message:"Internal server error"})
    }
    return res.status(200).json({status:"Data Saved Successfully"})
 }

module.exports={
    getSubjectDetails,
    saveSubjectDetails
}