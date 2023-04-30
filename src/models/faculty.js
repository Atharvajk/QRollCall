const mongoose= require('mongoose')
const Classroom=require('./classroom')
const Subject=require('./subject')
const schema=mongoose.Schema;

const subschema=new schema({
    day:{
        type:String,
        required:true
    },
    schedule:[{
       subject:{
         type:schema.Types.ObjectId,
         ref:'Subject',
         required:true
       },
       class:{
         type:String,
         required:true
       },
       satrtTime:{
          type:String,
          required:true
       },
       endTime:{
          type:String,
          required:true
       }
      }]
})
const faculty=new schema(
    {
        name:{
           type:String,
           required:true,
        },
        email:{
            type:String,
            required:true,
            unique:true
        },
        dept:{
           type:String,
           required:true,
        }, 
        mobNo:{
            type:String,
            required:true
        },
        password: {
            type: String,
            required: true,
        },  
        timeTable:[subschema]      
    }
)

module.exports=mongoose.model("Faculty",faculty)