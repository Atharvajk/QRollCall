const mongoose= require('mongoose')
const Classroom=require('./classroom')
const Schema=mongoose.Schema
const subschema=new Schema({
    year:{
        type:Number,
        required:true,
        unique:true
    },
    classroom:[{
            type:Schema.Types.ObjectId,
            ref:'Classroom'
    }]
})
const department=new Schema({
    name:{
       type:String,
       required:true,
       unique:true
    },
    grads:[subschema]
})

module.exports=mongoose.model("Department",department)
