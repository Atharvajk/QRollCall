const mongoose= require('mongoose')
const Semister=require('./semister')
const Classroom=require('./classroom')
const Schema= mongoose.Schema

const student=new Schema({
    name:{
        type:String,
        required:true,
     },
     department:{
       type:String,
       required: true
     },
     semister:{
        type:Schema.Types.ObjectId,
        ref:'Semister'
     },
     classroom:{
        type:Schema.Types.ObjectId,
        ref:'Classroom'
     },
     mobileNum: {
        type: String,
        required: true,
        unique: true
    },
    rollNo:{
        type:Number,
        required:true,
        unique:true
    },
    email:{
         type:String,
         required:true,
         unique:true
     },
    password:{
        type:String,
        required:true
    }
})

module.exports=mongoose.model('Student',student)