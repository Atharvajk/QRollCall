const Classroom=require('../models/classroom')
const Student=require('../models/student')
const getClassroomDetails=async (req,res,next)=>{
     var data;
     try{
        data=await  Classroom.find()
     }catch(err){
          next(err)
     }
     if(!data){
        return res.status(500).json({msg:"internalserver error"})
     }
     return res.status(200).json({status:"Success",data})
}

const saveClassroomDetails=async(req,res,next)=>{
      var {name,timetable}=req.body
      var data=new Classroom({
        name,timetable
      })
      data=data.save()
      if(!data){
        return res.status(500).json({msg:"internalserver error"})
      }
      return res.status(200).json({status:"Data Saved Successfully"})
} 
const deleteClassroom=async (req,res,next)=>{
  const id=req.params.id
  let user
  try{
    user= await Classroom.findByIdAndRemove(id)
  }catch(err){
     return err(next)
  }
  if(!user)
  return res.status(500).json({message:"Internal server error"})

  return res.status(200).json({msg:"Deleted suucessfully"})
}
const updateClassroom=async (req,res,next)=>{
  var id=req.params.id
  var {name,timetable}=req.body;
  let user
  try{
  user= await Classroom.findByIdAndUpdate(id,{name,timetable})
  }catch(err){
     return next(err) 
  }
  if(!user)
  return res.status(500).json({message:"Internal server error"})

  return res.status(200).json({msg:"Updated sucessfully"})  

}

const getTodaysSchedule=async(req,res,next)=>{
  const id=req.params.id
  var {day}=req.body;
  let user
  try{
  user= await Classroom.findById(id).populate({
   path:'timetable',
   populate: [
     {
       path: 'schedule',
       populate:[
         'subject'
       ]
     }
   ]
 })
  schedule=user.timetable
  var data=schedule.filter((val)=>{
     return val.day==day? val: false
  })
 
 if(data!=false){
   data=data[0]

   return res.status(200).json({status:"Success",data})
 }else{
   return res.status(500).json({message:"Internal server error"})
 }
  }catch(err){
    return next(err) 
  }
  
}

const getClassStudents=async(req,res,next)=>{
  // let allStuds
  const id=req.params.id
    try{
      var data=await Classroom.findById(id)
      console.log("classroom_id", data._id.toString())
      let allStuds = await Student.find({classroom:data._id.toString()})
      return res.status(200).json({status:"Success",allStuds})
   }catch(err){
        next(err)
   }
   if(!allStuds){
      return res.status(500).json({msg:"internalserver error"})
   }
   
}

module.exports={
 getClassroomDetails,
 saveClassroomDetails,
 deleteClassroom,
 updateClassroom,
 getTodaysSchedule,
 getClassStudents
}