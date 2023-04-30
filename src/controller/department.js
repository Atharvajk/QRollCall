const Department=require('../models/department')

const getDeptDetails=async (req,res,next)=>{
   var data;
   try{
    data=await Department.find()
   }catch(err){
    next(err)
   }
   if(!data){
    return res.status(500).json({message:"Internal server error"})
   }
   return res.status(200).json({status:"Success",data})
}

const saveDeptDetails=async (req,res,next)=>{
    const {name,grads}=req.body;
    var data
    try{
     data=new Department({
        name,grads
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
    getDeptDetails,
    saveDeptDetails
}