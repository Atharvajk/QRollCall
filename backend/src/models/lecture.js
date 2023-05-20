const mongoose= require('mongoose')
const Student=require('../models/student')
const Subject=require('../models/subject')
const Faculty=require('../models/faculty')
const Classroom=require('../models/classroom')
const Schema=mongoose.Schema

const subSchema= new Schema({
        studentId:{
            type:Schema.Types.ObjectId,
            ref:'Student'
        },
        isPresent: {
            type: Boolean,
            required: true,
            default:false
    }
})

const lecture=new Schema({ 
    facultyId:{
        type:Schema.Types.ObjectId,
        ref:'Faculty'
    },
    subjectId:{
        type:Schema.Types.ObjectId,
        ref:'Subject'
    },
    classroom:{
        type:Schema.Types.ObjectId,
        ref:'Classroom'
    },
    date:{
        type:Date,
        default:Date.now
    },
    allStudents:[subSchema]

})

module.exports=mongoose.model('Lecture',lecture)