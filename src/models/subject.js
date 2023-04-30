const mongoose=require('mongoose')

const Schema = mongoose.Schema

const subject= new Schema({
   subCode:{
    type:Number,
    reuired:true,
    unique:true
   },
   subject:{
    type:String,
    required:true
   }
})

module.exports=mongoose.model('Subject',subject)