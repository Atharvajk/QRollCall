const Semister=require('../models/semister')
const Subject=require('../models/subject')
const getSemDetails=async (req,res,next)=>{
   var data;
   var subDetails;
   try{
    data=await Semister.find().populate({
      path:'subjects'
    }) 
   }catch(err){
    next(err)
   }
   if(!data){
    return res.status(500).json({message:"Internal server error"})
   }
   return res.status(200).json({status:"Success",data})
}

const saveSemDetails=async (req,res,next)=>{
    const {semNo,subjects}=req.body;
    var data
    try{
     data=new Semister({
        semNo,subjects
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
    getSemDetails,
    saveSemDetails
}
