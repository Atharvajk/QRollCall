const express = require('express')
const mongoose=require('mongoose')
const faculty = require('./routes/faculty');
const institute=require('./routes/institute')
const department=require('./routes/department')
const classroom=require('./routes/classroom')
const semister=require('./routes/semister')
const subject=require('./routes/subject')
const student=require('./routes/student')
const lecture=require('./routes/lecture')
const app=express();
app.use(express.json())
app.use("/api/v1",faculty)
app.use("/api/v1",institute)
app.use("/api/v1",department)
app.use("/api/v1",classroom)
app.use("/api/v1",semister)
app.use("/api/v1",subject)
app.use("/api/v1",student)
app.use("/api/v1",lecture)

const PORT = process.env.PORT || 5000
mongoose.connect("mongodb+srv://admin:admin@cluster0.jzorhbx.mongodb.net/?retryWrites=true&w=majority").then(()=>{
    app.listen(5000,()=>{
    console.log(`Server Initiated on port ${PORT}`)
    });
}).catch((err)=>{
     console.log(err);
})
