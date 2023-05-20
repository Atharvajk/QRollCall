const mongoose=require('mongoose')
const Student=require('./student')
const Subject=require('./subject')
const Faculty=require('./faculty')
const Schema=mongoose.Schema

const subschema=new Schema({
    day:{
     type:String,
     required:true
    },
    schedule:[{
     subject:{
       type:Schema.Types.ObjectId,
       ref:'Subject',
       required:true
     },
     startTime:{
        type:String,
        required:true
     },
     endTime:{
        type:String,
        required:true
     },
     faculty:{
      type:String,
      required:true
     }
    }]
})
const classroom=new Schema({
    name:{
        type:String,
        required:true,
        unique:true
    },
    timetable:[subschema]

})

module.exports= mongoose.model("Classroom",classroom)