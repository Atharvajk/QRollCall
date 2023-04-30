const Institute= require('../models/institute')
const bcrypt = require('bcrypt');
const getInstitueDetails=async (req,res,next)=>{
    var data;
    try{
     data=await Institute.find()
    }catch(err){
     next(err)
    }
    if(!data){
     return res.status(500).json({message:"Internal server error"})
    }
    return res.status(200).json({status:"Success",data})
 }
 
 const saveInstituteDetails=async (req,res,next)=>{
     var {name,password,departments}=req.body;
     var data
     try{
      password=await bcrypt.hash(password, 10)
      data=new Institute({
         name,password,departments
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

  const institutelogin= async (req,res,next)=>{
      var {name,password}=req.body
    //  username=username.trim()
    //  password=password.trim()
     var data;
     try{
      data=await Faculty.findOne({name})
      console.log(data)
      if(!data)
        return  res.status(404).send('User not found!! Check the username again');
      const passwordMatch = await bcrypt.compare(password,data.password);
      if(!passwordMatch)
        return  res.status(404).json({msg:'Invalid Password'});
      return res.status(200).json({status:"Login Successful",data})
     }catch(err){
      next(err)
     }
  }
 
 module.exports={
    getInstitueDetails,
    saveInstituteDetails,
    institutelogin
 }