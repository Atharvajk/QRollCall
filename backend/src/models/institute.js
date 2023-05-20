const mongoose=require('mongoose')
const Department=require('./department')
const Schema=mongoose.Schema

const institute = new Schema({
    name:{
        type:String,
        required:true,
     },
     password:{
         type:String,
         required:true,
     },
     departments:[{
        type:Schema.Types.ObjectId,
        ref:  'Department'
     }]
})

module.exports=mongoose.model("Institute",institute)