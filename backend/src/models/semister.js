const mongoose=require('mongoose')
const Subject=require('./subject') 
const Schema = mongoose.Schema

const semister= new Schema({
   semNo:{
      type:Number,
      required:true,
      unique:true
   },
   subjects: [{
      type: Schema.Types.ObjectId,
      ref:  'Subject'
    }]
})

module.exports=mongoose.model('Semister',semister)